; DESCRIPTION: Composite: Places a blue line segment connecting (76, 213) to (210, 178) then Creates a red rectangular region at (313, 26) spanning 102 by 112 pixels then Creates a green circular shape at (424, 158) with radius 16.
; PLAN: r0=76(x1), r1=213(y1), r2=210(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=26(y), r7=102(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=424(x), r11=158(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 213
LDI r2, 210
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 26
LDI r7, 102
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 158
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
