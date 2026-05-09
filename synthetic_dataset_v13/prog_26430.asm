; DESCRIPTION: Renders a purple line between points (449, 14) and (413, 56).
; PLAN: r0=449(x1), r1=14(y1), r2=413(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 14
LDI r2, 413
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
