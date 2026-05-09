; DESCRIPTION: Places a magenta line segment connecting (221, 36) to (155, 198).
; PLAN: r0=221(x1), r1=36(y1), r2=155(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 36
LDI r2, 155
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
