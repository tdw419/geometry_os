; DESCRIPTION: Composite: Sets a single blue pixel at (218, 123) then Renders a red line between points (318, 173) and (13, 105) then Draws a green rectangle at (83, 22) with width 61 and height 30.
; PLAN: r0=218(x), r1=123(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=318(x1), r6=173(y1), r7=13(x2), r8=105(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=83(x), r11=22(y), r12=61(width), r13=30(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 123
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 318
LDI r6, 173
LDI r7, 13
LDI r8, 105
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 22
LDI r12, 61
LDI r13, 30
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
