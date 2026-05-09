; DESCRIPTION: Draws a purple line from (37, 234) to (175, 84).
; PLAN: r0=37(x1), r1=234(y1), r2=175(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 234
LDI r2, 175
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
