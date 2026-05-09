; DESCRIPTION: Renders a purple line between points (203, 185) and (438, 69).
; PLAN: r0=203(x1), r1=185(y1), r2=438(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 185
LDI r2, 438
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
