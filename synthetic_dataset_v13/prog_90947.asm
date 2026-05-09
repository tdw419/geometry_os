; DESCRIPTION: Draws a green line from (472, 136) to (497, 102).
; PLAN: r0=472(x1), r1=136(y1), r2=497(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 136
LDI r2, 497
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
