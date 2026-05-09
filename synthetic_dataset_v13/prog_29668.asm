; DESCRIPTION: Composite: Draws a cyan rectangle at (325, 126) with width 110 and height 84 then Sets a single orange pixel at (93, 46).
; PLAN: r0=325(x), r1=126(y), r2=110(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=46(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 126
LDI r2, 110
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 46
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
