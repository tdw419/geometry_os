; DESCRIPTION: Composite: Creates a green rectangular region at (393, 88) spanning 62 by 79 pixels then Renders a white line between points (272, 5) and (107, 226) then Renders a purple disk with center (406, 145) and radius 59.
; PLAN: r0=393(x), r1=88(y), r2=62(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x1), r6=5(y1), r7=107(x2), r8=226(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=145(y), r12=59(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 88
LDI r2, 62
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 5
LDI r7, 107
LDI r8, 226
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 145
LDI r12, 59
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
