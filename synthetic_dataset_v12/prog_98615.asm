; DESCRIPTION: Draws a white line from (375, 101) to (477, 201).
; PLAN: r0=375(x1), r1=101(y1), r2=477(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 101
LDI r2, 477
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
