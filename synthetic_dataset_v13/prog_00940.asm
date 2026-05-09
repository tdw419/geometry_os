; DESCRIPTION: Draws a blue line from (105, 35) to (341, 31).
; PLAN: r0=105(x1), r1=35(y1), r2=341(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 35
LDI r2, 341
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
