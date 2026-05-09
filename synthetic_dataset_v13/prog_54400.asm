; DESCRIPTION: Composite: Draws a magenta circle centered at (212, 144) with radius 23 then Sets a single black pixel at (42, 130).
; PLAN: r0=212(x), r1=144(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=130(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 144
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 130
LDI r7, 0x000000
PSET r5, r6, r7
HALT
