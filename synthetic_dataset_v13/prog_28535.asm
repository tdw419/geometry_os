; DESCRIPTION: Renders a purple line between points (95, 229) and (61, 205).
; PLAN: r0=95(x1), r1=229(y1), r2=61(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 229
LDI r2, 61
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
