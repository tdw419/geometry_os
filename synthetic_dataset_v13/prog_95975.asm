; DESCRIPTION: Composite: Draws a yellow line from (390, 205) to (176, 168) then Creates a green rectangular region at (359, 150) spanning 56 by 86 pixels then Creates a cyan circular shape at (332, 63) with radius 12.
; PLAN: r0=390(x1), r1=205(y1), r2=176(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=150(y), r7=56(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x), r11=63(y), r12=12(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 205
LDI r2, 176
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 150
LDI r7, 56
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 63
LDI r12, 12
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
