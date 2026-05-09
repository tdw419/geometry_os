; DESCRIPTION: Draws a magenta line from (385, 80) to (137, 135).
; PLAN: r0=385(x1), r1=80(y1), r2=137(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 80
LDI r2, 137
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
