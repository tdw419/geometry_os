; DESCRIPTION: Renders a purple line between points (475, 233) and (2, 131).
; PLAN: r0=475(x1), r1=233(y1), r2=2(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 233
LDI r2, 2
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
