; DESCRIPTION: Draws a magenta line from (193, 198) to (489, 131).
; PLAN: r0=193(x1), r1=198(y1), r2=489(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 198
LDI r2, 489
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
