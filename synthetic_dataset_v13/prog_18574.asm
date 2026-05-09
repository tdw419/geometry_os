; DESCRIPTION: Renders a green line between points (455, 216) and (435, 62).
; PLAN: r0=455(x1), r1=216(y1), r2=435(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 216
LDI r2, 435
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
