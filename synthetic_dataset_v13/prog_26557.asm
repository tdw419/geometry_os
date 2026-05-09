; DESCRIPTION: Composite: Draws a green rectangle at (434, 18) with width 55 and height 79 then Draws a green circle centered at (256, 176) with radius 71 then Sets a single red pixel at (315, 56).
; PLAN: r0=434(x), r1=18(y), r2=55(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=176(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x), r11=56(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 434
LDI r1, 18
LDI r2, 55
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 176
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 56
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
