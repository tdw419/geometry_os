; DESCRIPTION: Creates a purple circular shape at (395, 103) with radius 78.
; PLAN: r0=395(x), r1=103(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 103
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
