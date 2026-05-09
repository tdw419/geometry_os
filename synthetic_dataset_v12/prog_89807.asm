; DESCRIPTION: Draws a magenta line from (491, 78) to (266, 116).
; PLAN: r0=491(x1), r1=78(y1), r2=266(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 78
LDI r2, 266
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
