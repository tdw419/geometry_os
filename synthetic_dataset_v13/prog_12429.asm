; DESCRIPTION: Composite: Draws a magenta circle centered at (173, 126) with radius 80 then Sets a single green pixel at (65, 27).
; PLAN: r0=173(x), r1=126(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=27(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 173
LDI r1, 126
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 27
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
