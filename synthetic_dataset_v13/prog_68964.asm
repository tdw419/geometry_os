; DESCRIPTION: Draws a white line from (390, 100) to (204, 28).
; PLAN: r0=390(x1), r1=100(y1), r2=204(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 100
LDI r2, 204
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
