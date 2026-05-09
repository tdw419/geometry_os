; DESCRIPTION: Renders a orange line between points (13, 145) and (276, 39).
; PLAN: r0=13(x1), r1=145(y1), r2=276(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 145
LDI r2, 276
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
