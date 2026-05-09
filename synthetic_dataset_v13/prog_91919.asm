; DESCRIPTION: Draws a blue line from (378, 212) to (454, 18).
; PLAN: r0=378(x1), r1=212(y1), r2=454(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 212
LDI r2, 454
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
