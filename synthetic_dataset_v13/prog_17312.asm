; DESCRIPTION: Renders a purple line between points (482, 48) and (110, 254).
; PLAN: r0=482(x1), r1=48(y1), r2=110(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 48
LDI r2, 110
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
