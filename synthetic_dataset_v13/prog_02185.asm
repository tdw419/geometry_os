; DESCRIPTION: Draws a magenta line from (379, 5) to (412, 132).
; PLAN: r0=379(x1), r1=5(y1), r2=412(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 5
LDI r2, 412
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
