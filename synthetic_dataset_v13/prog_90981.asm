; DESCRIPTION: Composite: Creates a green rectangular region at (392, 169) spanning 70 by 79 pixels then Places a orange line segment connecting (144, 86) to (99, 230) then Renders a cyan disk with center (250, 84) and radius 62.
; PLAN: r0=392(x), r1=169(y), r2=70(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x1), r6=86(y1), r7=99(x2), r8=230(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=250(x), r11=84(y), r12=62(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 169
LDI r2, 70
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 86
LDI r7, 99
LDI r8, 230
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 84
LDI r12, 62
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
