; DESCRIPTION: Renders a magenta line between points (34, 77) and (363, 5).
; PLAN: r0=34(x1), r1=77(y1), r2=363(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 77
LDI r2, 363
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
