; DESCRIPTION: Composite: Renders a orange disk with center (347, 140) and radius 55 then Draws a blue rectangle at (427, 69) with width 16 and height 84 then Sets a single cyan pixel at (68, 234).
; PLAN: r0=347(x), r1=140(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x), r6=69(y), r7=16(width), r8=84(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=234(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 140
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 69
LDI r7, 16
LDI r8, 84
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 234
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
