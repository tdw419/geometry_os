; DESCRIPTION: Renders a purple line between points (362, 158) and (195, 76).
; PLAN: r0=362(x1), r1=158(y1), r2=195(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 158
LDI r2, 195
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
