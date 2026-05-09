; DESCRIPTION: Draws a orange line from (125, 82) to (251, 62).
; PLAN: r0=125(x1), r1=82(y1), r2=251(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 82
LDI r2, 251
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
