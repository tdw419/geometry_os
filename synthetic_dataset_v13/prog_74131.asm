; DESCRIPTION: Renders a yellow line between points (30, 135) and (200, 66).
; PLAN: r0=30(x1), r1=135(y1), r2=200(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 135
LDI r2, 200
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
