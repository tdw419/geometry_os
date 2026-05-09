; DESCRIPTION: Composite: Creates a orange rectangular region at (107, 20) spanning 35 by 85 pixels then Places a yellow line segment connecting (234, 184) to (442, 21) then Draws a blue circle centered at (200, 133) with radius 50.
; PLAN: r0=107(x), r1=20(y), r2=35(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x1), r6=184(y1), r7=442(x2), r8=21(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=200(x), r11=133(y), r12=50(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 107
LDI r1, 20
LDI r2, 35
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 184
LDI r7, 442
LDI r8, 21
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 133
LDI r12, 50
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
