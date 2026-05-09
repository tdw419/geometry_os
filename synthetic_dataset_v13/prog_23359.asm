; DESCRIPTION: Composite: Renders a green line between points (486, 105) and (75, 37) then Renders a yellow box of size 19x48 starting at (316, 108) then Places a orange circle of radius 18 at center (162, 176).
; PLAN: r0=486(x1), r1=105(y1), r2=75(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=108(y), r7=19(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=176(y), r12=18(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 486
LDI r1, 105
LDI r2, 75
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 108
LDI r7, 19
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 176
LDI r12, 18
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
