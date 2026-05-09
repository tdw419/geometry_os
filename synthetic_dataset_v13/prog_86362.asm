; DESCRIPTION: Composite: Draws a orange rectangle at (297, 14) with width 91 and height 37 then Sets a single orange pixel at (18, 178) then Renders a magenta line between points (149, 162) and (192, 251).
; PLAN: r0=297(x), r1=14(y), r2=91(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=178(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=149(x1), r11=162(y1), r12=192(x2), r13=251(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 14
LDI r2, 91
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 178
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 149
LDI r11, 162
LDI r12, 192
LDI r13, 251
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
