; DESCRIPTION: Renders a purple line between points (77, 184) and (229, 14).
; PLAN: r0=77(x1), r1=184(y1), r2=229(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 184
LDI r2, 229
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
