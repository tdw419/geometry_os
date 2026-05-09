; DESCRIPTION: Draws a purple line from (103, 19) to (130, 87).
; PLAN: r0=103(x1), r1=19(y1), r2=130(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 19
LDI r2, 130
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
