; DESCRIPTION: Draws a red line from (362, 203) to (37, 159).
; PLAN: r0=362(x1), r1=203(y1), r2=37(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 203
LDI r2, 37
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
