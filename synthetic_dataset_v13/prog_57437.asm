; DESCRIPTION: Renders a purple line between points (139, 22) and (240, 83).
; PLAN: r0=139(x1), r1=22(y1), r2=240(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 22
LDI r2, 240
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
