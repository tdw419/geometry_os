; DESCRIPTION: Draws a blue line from (427, 2) to (436, 210).
; PLAN: r0=427(x1), r1=2(y1), r2=436(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 2
LDI r2, 436
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
