; DESCRIPTION: Draws a purple line from (481, 62) to (492, 203).
; PLAN: r0=481(x1), r1=62(y1), r2=492(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 62
LDI r2, 492
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
