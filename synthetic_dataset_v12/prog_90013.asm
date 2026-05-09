; DESCRIPTION: Draws a red line from (473, 17) to (49, 201).
; PLAN: r0=473(x1), r1=17(y1), r2=49(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 17
LDI r2, 49
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
