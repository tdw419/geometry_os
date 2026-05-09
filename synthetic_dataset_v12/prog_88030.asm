; DESCRIPTION: Renders a orange line between points (297, 218) and (377, 21).
; PLAN: r0=297(x1), r1=218(y1), r2=377(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 218
LDI r2, 377
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
