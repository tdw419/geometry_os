; DESCRIPTION: Renders a purple line between points (277, 240) and (252, 87).
; PLAN: r0=277(x1), r1=240(y1), r2=252(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 240
LDI r2, 252
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
