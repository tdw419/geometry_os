; DESCRIPTION: Draws a blue line from (391, 198) to (217, 153).
; PLAN: r0=391(x1), r1=198(y1), r2=217(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 198
LDI r2, 217
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
