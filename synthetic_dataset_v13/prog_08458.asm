; DESCRIPTION: Renders a blue line between points (216, 68) and (119, 91).
; PLAN: r0=216(x1), r1=68(y1), r2=119(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 68
LDI r2, 119
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
