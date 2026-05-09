; DESCRIPTION: Draws a magenta line from (307, 3) to (476, 149).
; PLAN: r0=307(x1), r1=3(y1), r2=476(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 3
LDI r2, 476
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
