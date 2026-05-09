; DESCRIPTION: Renders a red line between points (229, 227) and (73, 123).
; PLAN: r0=229(x1), r1=227(y1), r2=73(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 227
LDI r2, 73
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
