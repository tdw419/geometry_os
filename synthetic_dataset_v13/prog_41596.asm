; DESCRIPTION: Creates a blue circular shape at (101, 166) with radius 66.
; PLAN: r0=101(x), r1=166(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 166
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
