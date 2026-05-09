; DESCRIPTION: Draws a red line from (506, 136) to (452, 203).
; PLAN: r0=506(x1), r1=136(y1), r2=452(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 136
LDI r2, 452
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
