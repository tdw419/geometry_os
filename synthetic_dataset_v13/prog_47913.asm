; DESCRIPTION: Renders a purple line between points (465, 135) and (137, 243).
; PLAN: r0=465(x1), r1=135(y1), r2=137(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 135
LDI r2, 137
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
