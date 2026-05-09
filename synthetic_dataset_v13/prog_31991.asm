; DESCRIPTION: Draws a blue line from (2, 217) to (203, 222).
; PLAN: r0=2(x1), r1=217(y1), r2=203(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 217
LDI r2, 203
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
