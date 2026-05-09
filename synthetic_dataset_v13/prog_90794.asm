; DESCRIPTION: Draws a magenta line from (132, 2) to (96, 116).
; PLAN: r0=132(x1), r1=2(y1), r2=96(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 2
LDI r2, 96
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
