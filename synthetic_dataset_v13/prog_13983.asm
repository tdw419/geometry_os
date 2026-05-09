; DESCRIPTION: Renders a purple line between points (473, 125) and (145, 30).
; PLAN: r0=473(x1), r1=125(y1), r2=145(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 125
LDI r2, 145
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
