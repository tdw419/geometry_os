; DESCRIPTION: Composite: Renders a blue line between points (156, 217) and (229, 140) then Draws a cyan rectangle at (193, 110) with width 75 and height 104 then Renders a blue disk with center (49, 168) and radius 49.
; PLAN: r0=156(x1), r1=217(y1), r2=229(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=110(y), r7=75(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=49(x), r11=168(y), r12=49(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 156
LDI r1, 217
LDI r2, 229
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 110
LDI r7, 75
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 168
LDI r12, 49
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
