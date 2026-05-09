; DESCRIPTION: Creates a blue circular shape at (292, 66) with radius 28.
; PLAN: r0=292(x), r1=66(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 66
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
