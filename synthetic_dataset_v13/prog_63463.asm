; DESCRIPTION: Draws a orange line from (148, 240) to (83, 156).
; PLAN: r0=148(x1), r1=240(y1), r2=83(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 240
LDI r2, 83
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
