; DESCRIPTION: Renders a blue line between points (9, 54) and (216, 64).
; PLAN: r0=9(x1), r1=54(y1), r2=216(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 54
LDI r2, 216
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
