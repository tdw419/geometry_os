; DESCRIPTION: Renders a purple line between points (243, 77) and (335, 181).
; PLAN: r0=243(x1), r1=77(y1), r2=335(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 77
LDI r2, 335
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
