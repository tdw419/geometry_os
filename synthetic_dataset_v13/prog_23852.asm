; DESCRIPTION: Composite: Draws a cyan circle centered at (61, 79) with radius 40 then Sets a single orange pixel at (144, 236).
; PLAN: r0=61(x), r1=79(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=236(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 79
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 236
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
