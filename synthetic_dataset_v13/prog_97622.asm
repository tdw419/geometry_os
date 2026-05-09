; DESCRIPTION: Draws a purple line from (279, 203) to (249, 234).
; PLAN: r0=279(x1), r1=203(y1), r2=249(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 203
LDI r2, 249
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
