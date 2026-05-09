; DESCRIPTION: Renders a purple line between points (490, 107) and (501, 69).
; PLAN: r0=490(x1), r1=107(y1), r2=501(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 107
LDI r2, 501
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
