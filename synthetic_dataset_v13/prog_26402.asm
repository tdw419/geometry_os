; DESCRIPTION: Draws a blue line from (6, 200) to (354, 55).
; PLAN: r0=6(x1), r1=200(y1), r2=354(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 200
LDI r2, 354
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
