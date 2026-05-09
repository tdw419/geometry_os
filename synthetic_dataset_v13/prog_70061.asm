; DESCRIPTION: Draws a white line from (279, 155) to (325, 34).
; PLAN: r0=279(x1), r1=155(y1), r2=325(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 155
LDI r2, 325
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
