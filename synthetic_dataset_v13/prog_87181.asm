; DESCRIPTION: Draws a white line from (266, 28) to (282, 229).
; PLAN: r0=266(x1), r1=28(y1), r2=282(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 28
LDI r2, 282
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
