; DESCRIPTION: Draws a magenta line from (244, 136) to (455, 198).
; PLAN: r0=244(x1), r1=136(y1), r2=455(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 136
LDI r2, 455
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
