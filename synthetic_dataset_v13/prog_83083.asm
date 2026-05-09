; DESCRIPTION: Composite: Draws a cyan circle centered at (81, 166) with radius 62 then Sets a single green pixel at (267, 78).
; PLAN: r0=81(x), r1=166(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=78(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 81
LDI r1, 166
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 78
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
