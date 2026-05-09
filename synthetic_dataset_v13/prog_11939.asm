; DESCRIPTION: Renders a red line between points (305, 201) and (363, 205).
; PLAN: r0=305(x1), r1=201(y1), r2=363(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 201
LDI r2, 363
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
