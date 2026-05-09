; DESCRIPTION: Renders a purple line between points (54, 220) and (20, 139).
; PLAN: r0=54(x1), r1=220(y1), r2=20(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 220
LDI r2, 20
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
