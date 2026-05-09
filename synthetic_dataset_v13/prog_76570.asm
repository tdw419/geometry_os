; DESCRIPTION: Composite: Places a purple 60x83 rectangle at position (21, 92) then Renders a purple line between points (56, 113) and (406, 99) then Draws a black circle centered at (149, 72) with radius 72.
; PLAN: r0=21(x), r1=92(y), r2=60(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x1), r6=113(y1), r7=406(x2), r8=99(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=149(x), r11=72(y), r12=72(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 92
LDI r2, 60
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 113
LDI r7, 406
LDI r8, 99
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 72
LDI r12, 72
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
