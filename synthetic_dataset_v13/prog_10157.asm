; DESCRIPTION: Composite: Draws a green rectangle at (229, 156) with width 108 and height 24 then Draws a purple circle centered at (412, 160) with radius 70 then Sets a single blue pixel at (510, 37).
; PLAN: r0=229(x), r1=156(y), r2=108(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=160(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=510(x), r11=37(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 156
LDI r2, 108
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 160
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 510
LDI r11, 37
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
