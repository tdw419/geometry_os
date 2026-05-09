; DESCRIPTION: Draws a purple line from (45, 7) to (436, 234).
; PLAN: r0=45(x1), r1=7(y1), r2=436(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 7
LDI r2, 436
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
