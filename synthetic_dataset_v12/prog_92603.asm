; DESCRIPTION: Renders a blue line between points (355, 216) and (330, 238).
; PLAN: r0=355(x1), r1=216(y1), r2=330(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 216
LDI r2, 330
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
