; DESCRIPTION: Draws a orange line from (468, 92) to (380, 74).
; PLAN: r0=468(x1), r1=92(y1), r2=380(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 92
LDI r2, 380
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
