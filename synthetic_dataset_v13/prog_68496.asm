; DESCRIPTION: Draws a yellow line from (379, 131) to (161, 32).
; PLAN: r0=379(x1), r1=131(y1), r2=161(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 131
LDI r2, 161
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
