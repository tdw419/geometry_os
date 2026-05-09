; DESCRIPTION: Draws a purple line from (320, 19) to (169, 112).
; PLAN: r0=320(x1), r1=19(y1), r2=169(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 19
LDI r2, 169
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
