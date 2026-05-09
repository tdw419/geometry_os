; DESCRIPTION: Renders a red line between points (428, 187) and (84, 201).
; PLAN: r0=428(x1), r1=187(y1), r2=84(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 187
LDI r2, 84
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
