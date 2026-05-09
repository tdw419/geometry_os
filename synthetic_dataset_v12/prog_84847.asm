; DESCRIPTION: Renders a blue line between points (130, 225) and (60, 216).
; PLAN: r0=130(x1), r1=225(y1), r2=60(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 225
LDI r2, 60
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
