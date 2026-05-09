; DESCRIPTION: Composite: Renders a red line between points (84, 65) and (159, 162) then Renders a orange box of size 100x36 starting at (84, 207) then Sets a single red pixel at (385, 206).
; PLAN: r0=84(x1), r1=65(y1), r2=159(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=207(y), r7=100(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x), r11=206(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 84
LDI r1, 65
LDI r2, 159
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 207
LDI r7, 100
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 206
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
