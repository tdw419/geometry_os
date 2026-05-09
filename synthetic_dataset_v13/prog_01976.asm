; DESCRIPTION: Composite: Creates a cyan rectangular region at (157, 29) spanning 106 by 113 pixels then Renders a orange line between points (454, 29) and (432, 249) then Creates a blue circular shape at (279, 128) with radius 24.
; PLAN: r0=157(x), r1=29(y), r2=106(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=29(y1), r7=432(x2), r8=249(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=128(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 157
LDI r1, 29
LDI r2, 106
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 29
LDI r7, 432
LDI r8, 249
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 128
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
