; DESCRIPTION: Renders a purple line between points (323, 237) and (481, 5).
; PLAN: r0=323(x1), r1=237(y1), r2=481(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 237
LDI r2, 481
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
