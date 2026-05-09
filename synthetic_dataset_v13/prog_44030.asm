; DESCRIPTION: Composite: Places a orange dot at position (133, 114) then Draws a magenta circle centered at (323, 240) with radius 10.
; PLAN: r0=133(x), r1=114(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=323(x), r6=240(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 114
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 323
LDI r6, 240
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
