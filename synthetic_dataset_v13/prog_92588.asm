; DESCRIPTION: Composite: Places a green line segment connecting (447, 233) to (426, 187) then Creates a red rectangular region at (130, 151) spanning 13 by 29 pixels then Renders a blue disk with center (301, 102) and radius 79.
; PLAN: r0=447(x1), r1=233(y1), r2=426(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=151(y), r7=13(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x), r11=102(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 447
LDI r1, 233
LDI r2, 426
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 151
LDI r7, 13
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 102
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
