; DESCRIPTION: Draws a blue line from (37, 122) to (511, 25).
; PLAN: r0=37(x1), r1=122(y1), r2=511(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 122
LDI r2, 511
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
