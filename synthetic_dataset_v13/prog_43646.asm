; DESCRIPTION: Composite: Renders a blue line between points (173, 198) and (258, 41) then Renders a orange box of size 32x84 starting at (222, 160) then Creates a white circular shape at (422, 164) with radius 66.
; PLAN: r0=173(x1), r1=198(y1), r2=258(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=160(y), r7=32(width), r8=84(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=164(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 198
LDI r2, 258
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 160
LDI r7, 32
LDI r8, 84
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 164
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
