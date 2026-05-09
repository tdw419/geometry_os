; DESCRIPTION: Renders a purple line between points (219, 213) and (80, 93).
; PLAN: r0=219(x1), r1=213(y1), r2=80(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 213
LDI r2, 80
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
