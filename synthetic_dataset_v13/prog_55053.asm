; DESCRIPTION: Composite: Renders a white disk with center (323, 103) and radius 79 then Places a blue line segment connecting (318, 31) to (109, 123) then Renders a orange box of size 38x68 starting at (409, 161).
; PLAN: r0=323(x), r1=103(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x1), r6=31(y1), r7=109(x2), r8=123(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=161(y), r12=38(width), r13=68(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 103
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 31
LDI r7, 109
LDI r8, 123
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 161
LDI r12, 38
LDI r13, 68
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
