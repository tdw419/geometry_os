; DESCRIPTION: Draws a red line from (131, 6) to (203, 191).
; PLAN: r0=131(x1), r1=6(y1), r2=203(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 6
LDI r2, 203
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
