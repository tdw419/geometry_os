; DESCRIPTION: Composite: Draws a red rectangle at (420, 49) with width 70 and height 45 then Draws a blue circle centered at (208, 175) with radius 79 then Sets a single orange pixel at (44, 114).
; PLAN: r0=420(x), r1=49(y), r2=70(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=175(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=44(x), r11=114(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 420
LDI r1, 49
LDI r2, 70
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 175
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 44
LDI r11, 114
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
