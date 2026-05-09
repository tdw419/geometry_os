; DESCRIPTION: Renders a purple line between points (68, 8) and (0, 114).
; PLAN: r0=68(x1), r1=8(y1), r2=0(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 8
LDI r2, 0
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
