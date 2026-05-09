; DESCRIPTION: Creates a blue circular shape at (432, 138) with radius 35.
; PLAN: r0=432(x), r1=138(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 138
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
