; DESCRIPTION: Composite: Renders a green disk with center (132, 101) and radius 63 then Draws a cyan rectangle at (315, 144) with width 110 and height 93 then Sets a single cyan pixel at (376, 7).
; PLAN: r0=132(x), r1=101(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x), r6=144(y), r7=110(width), r8=93(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=376(x), r11=7(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 101
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 144
LDI r7, 110
LDI r8, 93
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 7
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
