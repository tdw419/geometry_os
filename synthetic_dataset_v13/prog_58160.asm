; DESCRIPTION: Renders a purple line between points (126, 142) and (126, 110).
; PLAN: r0=126(x1), r1=142(y1), r2=126(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 142
LDI r2, 126
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
