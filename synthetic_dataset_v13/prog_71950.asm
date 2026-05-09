; DESCRIPTION: Draws a blue line from (347, 1) to (376, 212).
; PLAN: r0=347(x1), r1=1(y1), r2=376(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 1
LDI r2, 376
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
