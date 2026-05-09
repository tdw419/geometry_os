; DESCRIPTION: Renders a orange line between points (73, 91) and (297, 45).
; PLAN: r0=73(x1), r1=91(y1), r2=297(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 91
LDI r2, 297
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
