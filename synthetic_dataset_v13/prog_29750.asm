; DESCRIPTION: Renders a purple line between points (219, 20) and (90, 126).
; PLAN: r0=219(x1), r1=20(y1), r2=90(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 20
LDI r2, 90
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
