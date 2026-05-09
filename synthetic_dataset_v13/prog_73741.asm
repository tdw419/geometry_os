; DESCRIPTION: Composite: Draws a white rectangle at (277, 153) with width 46 and height 52 then Places a green line segment connecting (501, 187) to (160, 125) then Creates a orange circular shape at (404, 136) with radius 80.
; PLAN: r0=277(x), r1=153(y), r2=46(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x1), r6=187(y1), r7=160(x2), r8=125(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=404(x), r11=136(y), r12=80(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 153
LDI r2, 46
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 187
LDI r7, 160
LDI r8, 125
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 136
LDI r12, 80
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
