; DESCRIPTION: Draws a red line from (418, 137) to (434, 203).
; PLAN: r0=418(x1), r1=137(y1), r2=434(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 137
LDI r2, 434
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
