; DESCRIPTION: Draws a white line from (204, 3) to (137, 11).
; PLAN: r0=204(x1), r1=3(y1), r2=137(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 3
LDI r2, 137
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
