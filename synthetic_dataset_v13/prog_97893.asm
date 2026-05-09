; DESCRIPTION: Renders a blue line between points (385, 25) and (437, 191).
; PLAN: r0=385(x1), r1=25(y1), r2=437(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 25
LDI r2, 437
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
