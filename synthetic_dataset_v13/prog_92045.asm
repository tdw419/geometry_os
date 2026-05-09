; DESCRIPTION: Renders a yellow line between points (200, 92) and (87, 77).
; PLAN: r0=200(x1), r1=92(y1), r2=87(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 92
LDI r2, 87
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
