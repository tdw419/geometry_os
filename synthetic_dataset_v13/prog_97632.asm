; DESCRIPTION: Draws a magenta line from (353, 198) to (141, 24).
; PLAN: r0=353(x1), r1=198(y1), r2=141(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 198
LDI r2, 141
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
