; DESCRIPTION: Renders a blue line between points (475, 233) and (378, 15).
; PLAN: r0=475(x1), r1=233(y1), r2=378(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 233
LDI r2, 378
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
