; DESCRIPTION: Renders a purple line between points (143, 107) and (362, 211).
; PLAN: r0=143(x1), r1=107(y1), r2=362(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 107
LDI r2, 362
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
