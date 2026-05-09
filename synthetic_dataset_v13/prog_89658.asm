; DESCRIPTION: Renders a purple line between points (34, 4) and (143, 240).
; PLAN: r0=34(x1), r1=4(y1), r2=143(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 4
LDI r2, 143
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
