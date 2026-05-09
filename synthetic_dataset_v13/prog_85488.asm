; DESCRIPTION: Renders a purple line between points (62, 44) and (486, 195).
; PLAN: r0=62(x1), r1=44(y1), r2=486(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 44
LDI r2, 486
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
