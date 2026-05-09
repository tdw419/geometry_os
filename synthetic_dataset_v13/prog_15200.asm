; DESCRIPTION: Places a magenta circle of radius 10 at center (485, 22).
; PLAN: r0=485(x), r1=22(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 485
LDI r1, 22
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
