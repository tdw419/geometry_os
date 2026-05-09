; DESCRIPTION: Composite: Draws a orange circle centered at (75, 105) with radius 65 then Sets a single cyan pixel at (246, 156).
; PLAN: r0=75(x), r1=105(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=156(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 105
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 156
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
