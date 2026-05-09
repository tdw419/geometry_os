; DESCRIPTION: Draws a red line from (379, 131) to (452, 233).
; PLAN: r0=379(x1), r1=131(y1), r2=452(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 131
LDI r2, 452
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
