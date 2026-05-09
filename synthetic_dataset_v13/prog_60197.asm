; DESCRIPTION: Renders a blue line between points (359, 216) and (239, 129).
; PLAN: r0=359(x1), r1=216(y1), r2=239(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 216
LDI r2, 239
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
