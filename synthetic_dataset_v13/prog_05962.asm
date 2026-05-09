; DESCRIPTION: Draws a orange line from (281, 92) to (227, 58).
; PLAN: r0=281(x1), r1=92(y1), r2=227(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 92
LDI r2, 227
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
