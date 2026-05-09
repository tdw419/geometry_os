; DESCRIPTION: Renders a purple line between points (94, 255) and (442, 110).
; PLAN: r0=94(x1), r1=255(y1), r2=442(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 255
LDI r2, 442
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
