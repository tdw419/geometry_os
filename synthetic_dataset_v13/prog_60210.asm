; DESCRIPTION: Composite: Draws a black rectangle at (201, 94) with width 95 and height 39 then Renders a red line between points (360, 89) and (218, 153) then Draws a orange circle centered at (445, 78) with radius 59.
; PLAN: r0=201(x), r1=94(y), r2=95(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x1), r6=89(y1), r7=218(x2), r8=153(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=445(x), r11=78(y), r12=59(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 94
LDI r2, 95
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 89
LDI r7, 218
LDI r8, 153
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 78
LDI r12, 59
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
