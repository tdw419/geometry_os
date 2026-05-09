; DESCRIPTION: Renders a purple line between points (362, 10) and (20, 52).
; PLAN: r0=362(x1), r1=10(y1), r2=20(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 10
LDI r2, 20
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
