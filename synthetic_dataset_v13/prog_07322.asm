; DESCRIPTION: Draws a red line from (412, 60) to (379, 203).
; PLAN: r0=412(x1), r1=60(y1), r2=379(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 60
LDI r2, 379
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
