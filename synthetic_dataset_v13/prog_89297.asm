; DESCRIPTION: Draws a green line from (211, 89) to (436, 22).
; PLAN: r0=211(x1), r1=89(y1), r2=436(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 89
LDI r2, 436
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
