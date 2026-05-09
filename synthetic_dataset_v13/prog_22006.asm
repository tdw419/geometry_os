; DESCRIPTION: Renders a blue line between points (168, 216) and (381, 110).
; PLAN: r0=168(x1), r1=216(y1), r2=381(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 216
LDI r2, 381
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
