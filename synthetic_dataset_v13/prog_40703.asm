; DESCRIPTION: Draws a red line from (201, 203) to (337, 45).
; PLAN: r0=201(x1), r1=203(y1), r2=337(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 203
LDI r2, 337
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
