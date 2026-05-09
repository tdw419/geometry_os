; DESCRIPTION: Composite: Draws a blue line from (30, 231) to (441, 132) then Creates a yellow rectangular region at (160, 108) spanning 94 by 63 pixels then Places a orange circle of radius 55 at center (100, 191).
; PLAN: r0=30(x1), r1=231(y1), r2=441(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=108(y), r7=94(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=191(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 231
LDI r2, 441
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 108
LDI r7, 94
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 191
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
