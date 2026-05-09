; DESCRIPTION: Draws a orange line from (375, 147) to (189, 109).
; PLAN: r0=375(x1), r1=147(y1), r2=189(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 147
LDI r2, 189
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
