; DESCRIPTION: Renders a green line between points (186, 123) and (395, 77).
; PLAN: r0=186(x1), r1=123(y1), r2=395(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 123
LDI r2, 395
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
