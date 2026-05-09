; DESCRIPTION: Draws a magenta line from (452, 69) to (96, 116).
; PLAN: r0=452(x1), r1=69(y1), r2=96(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 69
LDI r2, 96
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
