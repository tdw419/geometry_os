; DESCRIPTION: Draws a orange line from (13, 147) to (289, 53).
; PLAN: r0=13(x1), r1=147(y1), r2=289(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 147
LDI r2, 289
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
