; DESCRIPTION: Draws a green line from (491, 92) to (288, 185).
; PLAN: r0=491(x1), r1=92(y1), r2=288(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 92
LDI r2, 288
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
