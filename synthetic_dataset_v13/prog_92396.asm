; DESCRIPTION: Draws a white line from (153, 155) to (65, 201).
; PLAN: r0=153(x1), r1=155(y1), r2=65(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 155
LDI r2, 65
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
