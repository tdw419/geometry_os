; DESCRIPTION: Creates a black circular shape at (118, 188) with radius 68.
; PLAN: r0=118(x), r1=188(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 188
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
