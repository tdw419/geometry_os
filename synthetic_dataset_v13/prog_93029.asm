; DESCRIPTION: Composite: Places a orange dot at position (351, 219) then Draws a green rectangle at (423, 96) with width 20 and height 110 then Renders a red line between points (489, 200) and (209, 139).
; PLAN: r0=351(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=423(x), r6=96(y), r7=20(width), r8=110(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x1), r11=200(y1), r12=209(x2), r13=139(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 423
LDI r6, 96
LDI r7, 20
LDI r8, 110
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 200
LDI r12, 209
LDI r13, 139
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
