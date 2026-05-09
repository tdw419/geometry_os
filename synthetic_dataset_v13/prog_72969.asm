; DESCRIPTION: Composite: Places a yellow dot at position (247, 136) then Creates a green circular shape at (188, 86) with radius 78.
; PLAN: r0=247(x), r1=136(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=86(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 136
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 188
LDI r6, 86
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
