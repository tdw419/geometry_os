; DESCRIPTION: Renders a purple line between points (141, 40) and (193, 29).
; PLAN: r0=141(x1), r1=40(y1), r2=193(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 40
LDI r2, 193
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
