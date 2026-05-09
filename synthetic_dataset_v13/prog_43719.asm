; DESCRIPTION: Draws a red line from (379, 58) to (374, 218).
; PLAN: r0=379(x1), r1=58(y1), r2=374(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 58
LDI r2, 374
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
