; DESCRIPTION: Draws a magenta line from (476, 60) to (1, 138).
; PLAN: r0=476(x1), r1=60(y1), r2=1(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 60
LDI r2, 1
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
