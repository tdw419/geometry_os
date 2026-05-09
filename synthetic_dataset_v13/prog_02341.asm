; DESCRIPTION: Draws a red line from (486, 203) to (181, 123).
; PLAN: r0=486(x1), r1=203(y1), r2=181(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 203
LDI r2, 181
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
