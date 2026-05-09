; DESCRIPTION: Creates a purple circular shape at (485, 234) with radius 22.
; PLAN: r0=485(x), r1=234(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 485
LDI r1, 234
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
