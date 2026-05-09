; DESCRIPTION: Renders a purple line between points (473, 135) and (13, 86).
; PLAN: r0=473(x1), r1=135(y1), r2=13(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 135
LDI r2, 13
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
