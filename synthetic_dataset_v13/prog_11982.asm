; DESCRIPTION: Renders a purple line between points (442, 227) and (386, 216).
; PLAN: r0=442(x1), r1=227(y1), r2=386(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 227
LDI r2, 386
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
