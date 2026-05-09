; DESCRIPTION: Renders a blue line between points (232, 217) and (437, 241).
; PLAN: r0=232(x1), r1=217(y1), r2=437(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 217
LDI r2, 437
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
