; DESCRIPTION: Draws a white line from (379, 106) to (184, 30).
; PLAN: r0=379(x1), r1=106(y1), r2=184(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 106
LDI r2, 184
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
