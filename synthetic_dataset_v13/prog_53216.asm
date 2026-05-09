; DESCRIPTION: Draws a green line from (379, 204) to (432, 120).
; PLAN: r0=379(x1), r1=204(y1), r2=432(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 204
LDI r2, 432
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
