; DESCRIPTION: Draws a red line from (341, 91) to (325, 116).
; PLAN: r0=341(x1), r1=91(y1), r2=325(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 91
LDI r2, 325
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
