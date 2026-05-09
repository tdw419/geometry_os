; DESCRIPTION: Composite: Places a orange circle of radius 51 at center (430, 106) then Draws a cyan rectangle at (145, 88) with width 45 and height 65 then Sets a single orange pixel at (62, 137).
; PLAN: r0=430(x), r1=106(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=88(y), r7=45(width), r8=65(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x), r11=137(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 430
LDI r1, 106
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 88
LDI r7, 45
LDI r8, 65
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 137
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
