; DESCRIPTION: Composite: Draws a blue line from (244, 106) to (48, 204) then Renders a yellow box of size 114x120 starting at (55, 0) then Creates a black circular shape at (78, 63) with radius 46.
; PLAN: r0=244(x1), r1=106(y1), r2=48(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=0(y), r7=114(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=78(x), r11=63(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 244
LDI r1, 106
LDI r2, 48
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 0
LDI r7, 114
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 63
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
