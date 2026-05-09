; DESCRIPTION: Creates a black circular shape at (158, 25) with radius 24.
; PLAN: r0=158(x), r1=25(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 25
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
