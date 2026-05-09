; DESCRIPTION: Draws a blue line from (127, 136) to (151, 133).
; PLAN: r0=127(x1), r1=136(y1), r2=151(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 136
LDI r2, 151
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
