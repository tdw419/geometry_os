; DESCRIPTION: Composite: Sets a single red pixel at (302, 160) then Draws a blue line from (331, 212) to (59, 105) then Places a orange circle of radius 49 at center (125, 83).
; PLAN: r0=302(x), r1=160(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=212(y1), r7=59(x2), r8=105(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=83(y), r12=49(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 160
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 331
LDI r6, 212
LDI r7, 59
LDI r8, 105
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 83
LDI r12, 49
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
