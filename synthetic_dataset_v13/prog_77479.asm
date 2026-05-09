; DESCRIPTION: Composite: Sets a single red pixel at (424, 175) then Places a green 45x96 rectangle at position (314, 84) then Draws a orange line from (81, 221) to (283, 145).
; PLAN: r0=424(x), r1=175(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=84(y), r7=45(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x1), r11=221(y1), r12=283(x2), r13=145(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 175
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 314
LDI r6, 84
LDI r7, 45
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 221
LDI r12, 283
LDI r13, 145
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
