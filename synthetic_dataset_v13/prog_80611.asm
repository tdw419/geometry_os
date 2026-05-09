; DESCRIPTION: Composite: Places a magenta line segment connecting (83, 155) to (174, 91) then Creates a red rectangular region at (476, 111) spanning 16 by 10 pixels then Draws a cyan circle centered at (304, 175) with radius 60.
; PLAN: r0=83(x1), r1=155(y1), r2=174(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=111(y), r7=16(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=175(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 83
LDI r1, 155
LDI r2, 174
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 111
LDI r7, 16
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 175
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
