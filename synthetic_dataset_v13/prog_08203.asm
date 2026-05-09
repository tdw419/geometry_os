; DESCRIPTION: Renders a purple line between points (499, 237) and (449, 237).
; PLAN: r0=499(x1), r1=237(y1), r2=449(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 237
LDI r2, 449
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
