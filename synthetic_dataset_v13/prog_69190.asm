; DESCRIPTION: Draws a yellow line from (375, 96) to (349, 201).
; PLAN: r0=375(x1), r1=96(y1), r2=349(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 96
LDI r2, 349
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
