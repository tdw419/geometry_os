; DESCRIPTION: Draws a blue line from (312, 104) to (473, 52).
; PLAN: r0=312(x1), r1=104(y1), r2=473(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 104
LDI r2, 473
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
