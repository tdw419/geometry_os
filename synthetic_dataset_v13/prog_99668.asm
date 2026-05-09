; DESCRIPTION: Renders a blue line between points (186, 220) and (377, 217).
; PLAN: r0=186(x1), r1=220(y1), r2=377(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 220
LDI r2, 377
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
