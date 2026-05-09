; DESCRIPTION: Renders a purple line between points (342, 209) and (314, 98).
; PLAN: r0=342(x1), r1=209(y1), r2=314(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 209
LDI r2, 314
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
