; DESCRIPTION: Composite: Places a red line segment connecting (218, 11) to (95, 167) then Places a green dot at position (207, 201) then Draws a orange rectangle at (372, 160) with width 33 and height 87.
; PLAN: r0=218(x1), r1=11(y1), r2=95(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=201(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=372(x), r11=160(y), r12=33(width), r13=87(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 11
LDI r2, 95
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 201
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 372
LDI r11, 160
LDI r12, 33
LDI r13, 87
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
