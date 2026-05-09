; DESCRIPTION: Composite: Places a yellow 114x30 rectangle at position (200, 213) then Renders a blue line between points (280, 159) and (427, 21) then Creates a yellow circular shape at (406, 108) with radius 41.
; PLAN: r0=200(x), r1=213(y), r2=114(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x1), r6=159(y1), r7=427(x2), r8=21(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=108(y), r12=41(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 213
LDI r2, 114
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 159
LDI r7, 427
LDI r8, 21
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 108
LDI r12, 41
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
