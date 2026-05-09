; DESCRIPTION: Composite: Renders a green disk with center (221, 104) and radius 66 then Draws a blue line from (442, 123) to (39, 152) then Creates a orange rectangular region at (18, 133) spanning 50 by 76 pixels.
; PLAN: r0=221(x), r1=104(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x1), r6=123(y1), r7=39(x2), r8=152(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=18(x), r11=133(y), r12=50(width), r13=76(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 104
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 123
LDI r7, 39
LDI r8, 152
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 133
LDI r12, 50
LDI r13, 76
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
