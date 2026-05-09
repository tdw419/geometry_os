; DESCRIPTION: Draws a yellow line from (25, 92) to (90, 41).
; PLAN: r0=25(x1), r1=92(y1), r2=90(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 92
LDI r2, 90
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
