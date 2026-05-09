; DESCRIPTION: Draws a red line from (111, 120) to (201, 185).
; PLAN: r0=111(x1), r1=120(y1), r2=201(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 120
LDI r2, 201
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
