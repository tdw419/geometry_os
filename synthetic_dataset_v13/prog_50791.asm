; DESCRIPTION: Draws a yellow line from (362, 136) to (133, 133).
; PLAN: r0=362(x1), r1=136(y1), r2=133(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 136
LDI r2, 133
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
