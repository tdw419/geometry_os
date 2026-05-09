; DESCRIPTION: Renders a purple line between points (130, 250) and (362, 122).
; PLAN: r0=130(x1), r1=250(y1), r2=362(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 250
LDI r2, 362
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
