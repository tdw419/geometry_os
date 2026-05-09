; DESCRIPTION: Draws a red line from (372, 15) to (142, 201).
; PLAN: r0=372(x1), r1=15(y1), r2=142(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 15
LDI r2, 142
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
