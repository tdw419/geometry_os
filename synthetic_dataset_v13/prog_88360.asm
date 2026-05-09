; DESCRIPTION: Draws a magenta line from (476, 254) to (354, 25).
; PLAN: r0=476(x1), r1=254(y1), r2=354(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 254
LDI r2, 354
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
