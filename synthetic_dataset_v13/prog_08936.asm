; DESCRIPTION: Draws a purple line from (39, 234) to (150, 133).
; PLAN: r0=39(x1), r1=234(y1), r2=150(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 234
LDI r2, 150
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
