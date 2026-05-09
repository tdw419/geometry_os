; DESCRIPTION: Draws a red line from (10, 170) to (477, 33).
; PLAN: r0=10(x1), r1=170(y1), r2=477(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 170
LDI r2, 477
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
