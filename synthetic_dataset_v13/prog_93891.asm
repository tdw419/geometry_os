; DESCRIPTION: Composite: Draws a magenta circle centered at (318, 171) with radius 79 then Sets a single cyan pixel at (33, 227).
; PLAN: r0=318(x), r1=171(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=227(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 171
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 227
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
