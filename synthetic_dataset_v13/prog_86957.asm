; DESCRIPTION: Renders a purple line between points (312, 209) and (375, 252).
; PLAN: r0=312(x1), r1=209(y1), r2=375(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 209
LDI r2, 375
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
