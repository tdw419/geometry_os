; DESCRIPTION: Composite: Places a yellow dot at position (506, 104) then Renders a blue line between points (62, 144) and (250, 70) then Draws a orange rectangle at (395, 219) with width 50 and height 10.
; PLAN: r0=506(x), r1=104(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=62(x1), r6=144(y1), r7=250(x2), r8=70(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=219(y), r12=50(width), r13=10(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 506
LDI r1, 104
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 62
LDI r6, 144
LDI r7, 250
LDI r8, 70
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 219
LDI r12, 50
LDI r13, 10
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
