; DESCRIPTION: Draws a blue line from (368, 181) to (107, 15).
; PLAN: r0=368(x1), r1=181(y1), r2=107(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 181
LDI r2, 107
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
