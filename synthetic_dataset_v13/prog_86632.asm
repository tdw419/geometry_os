; DESCRIPTION: Draws a red line from (51, 154) to (489, 203).
; PLAN: r0=51(x1), r1=154(y1), r2=489(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 154
LDI r2, 489
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
