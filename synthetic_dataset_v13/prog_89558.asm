; DESCRIPTION: Places a red line segment connecting (201, 60) to (452, 83).
; PLAN: r0=201(x1), r1=60(y1), r2=452(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 60
LDI r2, 452
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
