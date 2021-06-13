L=5;
T=5;
dx = 0.05;
dt = 0.001;
x=0:dx:L;
t=0:dt:T;
u=sin(x).*exp(-T); %original function f(x,t)
  
Nx = length(x);
Nt = length(t);
mu = dt/(dx.*dx);

%Boundary Conditions
R(1,2:Nt) = 0 ;
R(Nx,2:Nt)= sin(x(Nx)) .* exp(-t(2:Nt));

%Initial conditions
R(1:Nx,1) = sin( x(1:Nx));
for n = 1:Nt-1
    for  j=2:Nx-1
    R(j,n+1)= R(j,n) + mu.*( R(j+1,n) - 2.*R(j,n) + R(j-1,n) );
    end
end
plot(x,u,'*')
hold on
plot(x,R(:,Nt),'-')
