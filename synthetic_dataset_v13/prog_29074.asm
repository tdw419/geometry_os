; DESCRIPTION: Draws a orange line from (149, 187) to (399, 156).
; PLAN: r0=149(x1), r1=187(y1), r2=399(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 187
LDI r2, 399
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
