; DESCRIPTION: Draws a white line from (223, 72) to (297, 123).
; PLAN: r0=223(x1), r1=72(y1), r2=297(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 72
LDI r2, 297
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
