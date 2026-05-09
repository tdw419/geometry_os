; DESCRIPTION: Renders a purple line between points (27, 30) and (473, 115).
; PLAN: r0=27(x1), r1=30(y1), r2=473(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 30
LDI r2, 473
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
