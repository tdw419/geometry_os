; DESCRIPTION: Creates a blue circular shape at (411, 99) with radius 47.
; PLAN: r0=411(x), r1=99(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 99
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
