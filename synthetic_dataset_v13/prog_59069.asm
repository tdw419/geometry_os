; DESCRIPTION: Renders a orange line between points (15, 187) and (461, 109).
; PLAN: r0=15(x1), r1=187(y1), r2=461(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 187
LDI r2, 461
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
