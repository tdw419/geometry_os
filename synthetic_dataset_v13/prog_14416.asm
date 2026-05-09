; DESCRIPTION: Renders a blue line between points (319, 94) and (211, 138).
; PLAN: r0=319(x1), r1=94(y1), r2=211(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 94
LDI r2, 211
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
