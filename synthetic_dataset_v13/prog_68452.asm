; DESCRIPTION: Composite: Sets a single yellow pixel at (232, 208) then Renders a orange line between points (229, 227) and (194, 63) then Draws a cyan rectangle at (270, 25) with width 80 and height 78.
; PLAN: r0=232(x), r1=208(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=229(x1), r6=227(y1), r7=194(x2), r8=63(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=270(x), r11=25(y), r12=80(width), r13=78(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 208
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 229
LDI r6, 227
LDI r7, 194
LDI r8, 63
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 25
LDI r12, 80
LDI r13, 78
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
