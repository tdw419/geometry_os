; DESCRIPTION: Composite: Places a black line segment connecting (119, 149) to (186, 34) then Draws a green circle centered at (188, 95) with radius 20 then Creates a cyan rectangular region at (120, 84) spanning 62 by 70 pixels.
; PLAN: r0=119(x1), r1=149(y1), r2=186(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=95(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=84(y), r12=62(width), r13=70(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 149
LDI r2, 186
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 95
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 84
LDI r12, 62
LDI r13, 70
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
