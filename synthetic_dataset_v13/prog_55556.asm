; DESCRIPTION: Composite: Draws a magenta circle centered at (312, 78) with radius 63 then Sets a single cyan pixel at (231, 217).
; PLAN: r0=312(x), r1=78(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x), r6=217(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 78
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 217
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
