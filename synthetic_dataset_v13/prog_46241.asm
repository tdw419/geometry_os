; DESCRIPTION: Composite: Creates a yellow rectangular region at (49, 84) spanning 40 by 90 pixels then Draws a blue line from (494, 190) to (267, 232) then Draws a black circle centered at (43, 36) with radius 32.
; PLAN: r0=49(x), r1=84(y), r2=40(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x1), r6=190(y1), r7=267(x2), r8=232(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=43(x), r11=36(y), r12=32(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 84
LDI r2, 40
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 190
LDI r7, 267
LDI r8, 232
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 36
LDI r12, 32
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
