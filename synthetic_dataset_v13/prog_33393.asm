; DESCRIPTION: Draws a orange line from (141, 92) to (222, 21).
; PLAN: r0=141(x1), r1=92(y1), r2=222(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 92
LDI r2, 222
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
