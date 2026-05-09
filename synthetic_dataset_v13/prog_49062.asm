; DESCRIPTION: Places a red line segment connecting (221, 231) to (379, 250).
; PLAN: r0=221(x1), r1=231(y1), r2=379(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 231
LDI r2, 379
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
