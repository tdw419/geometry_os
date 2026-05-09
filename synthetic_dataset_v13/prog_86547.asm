; DESCRIPTION: Composite: Places a red line segment connecting (261, 212) to (335, 249) then Creates a purple rectangular region at (280, 149) spanning 54 by 40 pixels then Draws a cyan circle centered at (429, 129) with radius 17.
; PLAN: r0=261(x1), r1=212(y1), r2=335(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=149(y), r7=54(width), r8=40(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x), r11=129(y), r12=17(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 212
LDI r2, 335
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 149
LDI r7, 54
LDI r8, 40
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 129
LDI r12, 17
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
