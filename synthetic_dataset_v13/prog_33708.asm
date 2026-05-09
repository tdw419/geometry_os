; DESCRIPTION: Renders a orange line between points (125, 65) and (281, 85).
; PLAN: r0=125(x1), r1=65(y1), r2=281(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 65
LDI r2, 281
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
