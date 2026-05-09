; DESCRIPTION: Composite: Draws a black rectangle at (300, 84) with width 119 and height 10 then Places a purple circle of radius 62 at center (250, 96) then Sets a single red pixel at (329, 5).
; PLAN: r0=300(x), r1=84(y), r2=119(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=96(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=329(x), r11=5(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 300
LDI r1, 84
LDI r2, 119
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 96
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 329
LDI r11, 5
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
