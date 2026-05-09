; DESCRIPTION: Draws a magenta line from (491, 160) to (165, 116).
; PLAN: r0=491(x1), r1=160(y1), r2=165(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 160
LDI r2, 165
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
