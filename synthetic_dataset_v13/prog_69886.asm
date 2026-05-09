; DESCRIPTION: Renders a blue line between points (216, 87) and (70, 130).
; PLAN: r0=216(x1), r1=87(y1), r2=70(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 87
LDI r2, 70
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
