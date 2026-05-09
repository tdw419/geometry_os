; DESCRIPTION: Draws a orange line from (89, 54) to (122, 75).
; PLAN: r0=89(x1), r1=54(y1), r2=122(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 54
LDI r2, 122
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
