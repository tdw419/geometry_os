; DESCRIPTION: Draws a green line from (49, 145) to (442, 201).
; PLAN: r0=49(x1), r1=145(y1), r2=442(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 145
LDI r2, 442
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
