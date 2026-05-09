; DESCRIPTION: Composite: Draws a green rectangle at (52, 46) with width 95 and height 85 then Sets a single cyan pixel at (381, 145).
; PLAN: r0=52(x), r1=46(y), r2=95(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=145(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 52
LDI r1, 46
LDI r2, 95
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 145
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
