; DESCRIPTION: Renders a purple line between points (378, 35) and (6, 178).
; PLAN: r0=378(x1), r1=35(y1), r2=6(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 35
LDI r2, 6
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
