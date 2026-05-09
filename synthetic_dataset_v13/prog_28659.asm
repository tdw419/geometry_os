; DESCRIPTION: Composite: Places a red line segment connecting (19, 122) to (426, 46) then Creates a red rectangular region at (371, 34) spanning 119 by 102 pixels then Draws a blue circle centered at (319, 161) with radius 70.
; PLAN: r0=19(x1), r1=122(y1), r2=426(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=34(y), r7=119(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=161(y), r12=70(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 122
LDI r2, 426
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 34
LDI r7, 119
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 161
LDI r12, 70
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
