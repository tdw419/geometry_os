; DESCRIPTION: Draws a purple line from (430, 203) to (461, 69).
; PLAN: r0=430(x1), r1=203(y1), r2=461(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 203
LDI r2, 461
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
