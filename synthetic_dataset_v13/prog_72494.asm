; DESCRIPTION: Composite: Places a orange line segment connecting (350, 156) to (41, 174) then Draws a yellow circle centered at (452, 145) with radius 59.
; PLAN: r0=350(x1), r1=156(y1), r2=41(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=145(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 156
LDI r2, 41
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 145
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
