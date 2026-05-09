; DESCRIPTION: Draws a red line from (459, 41) to (324, 156).
; PLAN: r0=459(x1), r1=41(y1), r2=324(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 41
LDI r2, 324
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
