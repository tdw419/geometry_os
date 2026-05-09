; DESCRIPTION: Renders a purple line between points (96, 101) and (68, 91).
; PLAN: r0=96(x1), r1=101(y1), r2=68(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 101
LDI r2, 68
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
