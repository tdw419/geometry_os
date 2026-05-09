; DESCRIPTION: Draws a magenta line from (230, 181) to (131, 122).
; PLAN: r0=230(x1), r1=181(y1), r2=131(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 181
LDI r2, 131
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
