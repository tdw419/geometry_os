; DESCRIPTION: Renders a blue line between points (62, 46) and (52, 170).
; PLAN: r0=62(x1), r1=46(y1), r2=52(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 46
LDI r2, 52
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
