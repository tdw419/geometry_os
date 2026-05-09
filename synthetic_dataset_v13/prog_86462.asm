; DESCRIPTION: Composite: Places a white 31x65 rectangle at position (390, 45) then Draws a orange line from (191, 9) to (158, 189) then Creates a white circular shape at (352, 145) with radius 50.
; PLAN: r0=390(x), r1=45(y), r2=31(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x1), r6=9(y1), r7=158(x2), r8=189(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=352(x), r11=145(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 45
LDI r2, 31
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 9
LDI r7, 158
LDI r8, 189
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 145
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
