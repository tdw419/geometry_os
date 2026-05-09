; DESCRIPTION: Renders a purple line between points (413, 243) and (5, 179).
; PLAN: r0=413(x1), r1=243(y1), r2=5(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 243
LDI r2, 5
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
