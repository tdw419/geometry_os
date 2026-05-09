; DESCRIPTION: Composite: Draws a cyan rectangle at (371, 144) with width 113 and height 87 then Renders a blue disk with center (49, 224) and radius 17 then Sets a single orange pixel at (207, 86).
; PLAN: r0=371(x), r1=144(y), r2=113(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=224(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=207(x), r11=86(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 144
LDI r2, 113
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 224
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 207
LDI r11, 86
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
