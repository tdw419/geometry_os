; DESCRIPTION: Renders a green line between points (112, 92) and (484, 44).
; PLAN: r0=112(x1), r1=92(y1), r2=484(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 92
LDI r2, 484
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
