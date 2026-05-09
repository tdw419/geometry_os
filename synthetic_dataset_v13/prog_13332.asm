; DESCRIPTION: Creates a purple circular shape at (395, 138) with radius 18.
; PLAN: r0=395(x), r1=138(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 138
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
