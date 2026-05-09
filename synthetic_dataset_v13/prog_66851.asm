; DESCRIPTION: Draws a cyan line from (139, 227) to (379, 241).
; PLAN: r0=139(x1), r1=227(y1), r2=379(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 227
LDI r2, 379
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
