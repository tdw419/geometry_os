; DESCRIPTION: Composite: Places a green line segment connecting (472, 157) to (475, 125) then Sets a single orange pixel at (337, 208) then Draws a magenta rectangle at (374, 179) with width 108 and height 46.
; PLAN: r0=472(x1), r1=157(y1), r2=475(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=208(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=374(x), r11=179(y), r12=108(width), r13=46(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 157
LDI r2, 475
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 208
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 374
LDI r11, 179
LDI r12, 108
LDI r13, 46
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
