; DESCRIPTION: Renders a purple line between points (321, 240) and (243, 135).
; PLAN: r0=321(x1), r1=240(y1), r2=243(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 240
LDI r2, 243
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
