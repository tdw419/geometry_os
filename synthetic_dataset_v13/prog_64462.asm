; DESCRIPTION: Renders a blue line between points (364, 94) and (65, 142).
; PLAN: r0=364(x1), r1=94(y1), r2=65(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 94
LDI r2, 65
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
