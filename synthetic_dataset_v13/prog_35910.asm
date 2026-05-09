; DESCRIPTION: Draws a blue line from (466, 3) to (418, 251).
; PLAN: r0=466(x1), r1=3(y1), r2=418(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 3
LDI r2, 418
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
