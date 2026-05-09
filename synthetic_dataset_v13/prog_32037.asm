; DESCRIPTION: Draws a orange line from (396, 92) to (493, 112).
; PLAN: r0=396(x1), r1=92(y1), r2=493(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 92
LDI r2, 493
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
