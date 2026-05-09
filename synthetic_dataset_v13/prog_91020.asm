; DESCRIPTION: Renders a orange line between points (102, 124) and (311, 34).
; PLAN: r0=102(x1), r1=124(y1), r2=311(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 124
LDI r2, 311
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
