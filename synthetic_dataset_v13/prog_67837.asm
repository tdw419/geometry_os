; DESCRIPTION: Draws a blue line from (316, 161) to (3, 139).
; PLAN: r0=316(x1), r1=161(y1), r2=3(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 161
LDI r2, 3
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
