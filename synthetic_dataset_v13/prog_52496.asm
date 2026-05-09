; DESCRIPTION: Renders a yellow line between points (493, 73) and (200, 118).
; PLAN: r0=493(x1), r1=73(y1), r2=200(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 73
LDI r2, 200
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
