; DESCRIPTION: Renders a blue line between points (309, 232) and (192, 31).
; PLAN: r0=309(x1), r1=232(y1), r2=192(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 232
LDI r2, 192
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
