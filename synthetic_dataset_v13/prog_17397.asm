; DESCRIPTION: Renders a purple line between points (376, 200) and (150, 25).
; PLAN: r0=376(x1), r1=200(y1), r2=150(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 200
LDI r2, 150
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
