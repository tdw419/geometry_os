; DESCRIPTION: Renders a purple line between points (475, 95) and (357, 75).
; PLAN: r0=475(x1), r1=95(y1), r2=357(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 95
LDI r2, 357
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
