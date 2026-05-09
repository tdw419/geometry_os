; DESCRIPTION: Draws a green line from (349, 17) to (476, 0).
; PLAN: r0=349(x1), r1=17(y1), r2=476(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 17
LDI r2, 476
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
