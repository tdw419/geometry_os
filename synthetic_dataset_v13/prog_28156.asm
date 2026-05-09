; DESCRIPTION: Renders a blue line between points (247, 75) and (140, 77).
; PLAN: r0=247(x1), r1=75(y1), r2=140(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 75
LDI r2, 140
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
