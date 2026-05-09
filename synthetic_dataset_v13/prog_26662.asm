; DESCRIPTION: Renders a blue line between points (462, 192) and (226, 37).
; PLAN: r0=462(x1), r1=192(y1), r2=226(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 192
LDI r2, 226
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
