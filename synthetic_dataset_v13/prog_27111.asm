; DESCRIPTION: Draws a blue line from (436, 18) to (462, 218).
; PLAN: r0=436(x1), r1=18(y1), r2=462(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 18
LDI r2, 462
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
