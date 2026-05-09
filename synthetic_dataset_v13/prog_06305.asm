; DESCRIPTION: Renders a orange line between points (486, 172) and (437, 112).
; PLAN: r0=486(x1), r1=172(y1), r2=437(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 172
LDI r2, 437
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
