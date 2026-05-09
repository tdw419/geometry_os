; DESCRIPTION: Composite: Creates a blue rectangular region at (394, 75) spanning 80 by 78 pixels then Creates a orange circular shape at (231, 155) with radius 73 then Draws a cyan line from (505, 161) to (90, 39).
; PLAN: r0=394(x), r1=75(y), r2=80(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=155(y), r7=73(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x1), r11=161(y1), r12=90(x2), r13=39(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 75
LDI r2, 80
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 155
LDI r7, 73
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 161
LDI r12, 90
LDI r13, 39
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
