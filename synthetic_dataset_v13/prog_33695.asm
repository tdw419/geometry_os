; DESCRIPTION: Draws a black circle centered at (179, 129) with radius 75.
; PLAN: r0=179(x), r1=129(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 129
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
