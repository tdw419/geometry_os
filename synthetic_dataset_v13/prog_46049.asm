; DESCRIPTION: Creates a green circular shape at (74, 155) with radius 24.
; PLAN: r0=74(x), r1=155(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 155
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
