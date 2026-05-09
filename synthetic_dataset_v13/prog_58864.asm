; DESCRIPTION: Composite: Draws a white line from (202, 88) to (450, 142) then Creates a cyan rectangular region at (155, 60) spanning 91 by 21 pixels then Draws a blue circle centered at (196, 184) with radius 56.
; PLAN: r0=202(x1), r1=88(y1), r2=450(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=60(y), r7=91(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x), r11=184(y), r12=56(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 202
LDI r1, 88
LDI r2, 450
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 60
LDI r7, 91
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 184
LDI r12, 56
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
