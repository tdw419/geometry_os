; DESCRIPTION: Draws a blue line from (71, 198) to (151, 2).
; PLAN: r0=71(x1), r1=198(y1), r2=151(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 198
LDI r2, 151
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
