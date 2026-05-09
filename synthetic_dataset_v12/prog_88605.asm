; DESCRIPTION: Draws a blue line from (221, 188) to (267, 101).
; PLAN: r0=221(x1), r1=188(y1), r2=267(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 188
LDI r2, 267
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
