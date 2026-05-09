; DESCRIPTION: Draws a red line from (325, 7) to (163, 53).
; PLAN: r0=325(x1), r1=7(y1), r2=163(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 7
LDI r2, 163
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
