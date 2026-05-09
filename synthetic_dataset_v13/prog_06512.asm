; DESCRIPTION: Composite: Draws a yellow rectangle at (21, 104) with width 23 and height 102 then Places a red line segment connecting (508, 113) to (447, 55) then Renders a purple disk with center (63, 22) and radius 18.
; PLAN: r0=21(x), r1=104(y), r2=23(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x1), r6=113(y1), r7=447(x2), r8=55(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=22(y), r12=18(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 104
LDI r2, 23
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 113
LDI r7, 447
LDI r8, 55
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 22
LDI r12, 18
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
