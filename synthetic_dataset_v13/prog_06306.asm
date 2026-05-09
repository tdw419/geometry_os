; DESCRIPTION: Renders a purple line between points (368, 195) and (490, 103).
; PLAN: r0=368(x1), r1=195(y1), r2=490(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 195
LDI r2, 490
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
