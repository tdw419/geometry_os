; DESCRIPTION: Composite: Draws a purple rectangle at (358, 70) with width 67 and height 34 then Draws a blue circle centered at (165, 115) with radius 45 then Places a orange dot at position (474, 185).
; PLAN: r0=358(x), r1=70(y), r2=67(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=115(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x), r11=185(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 70
LDI r2, 67
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 115
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 185
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
