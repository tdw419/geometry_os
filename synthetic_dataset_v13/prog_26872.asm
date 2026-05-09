; DESCRIPTION: Composite: Draws a red circle centered at (400, 180) with radius 53 then Draws a green rectangle at (261, 65) with width 104 and height 118 then Renders a orange line between points (470, 174) and (410, 238).
; PLAN: r0=400(x), r1=180(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=65(y), r7=104(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x1), r11=174(y1), r12=410(x2), r13=238(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 180
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 65
LDI r7, 104
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 174
LDI r12, 410
LDI r13, 238
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
