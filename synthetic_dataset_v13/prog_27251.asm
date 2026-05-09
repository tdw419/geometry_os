; DESCRIPTION: Composite: Places a white dot at position (249, 144) then Draws a magenta circle centered at (158, 106) with radius 26.
; PLAN: r0=249(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=106(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 158
LDI r6, 106
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
