; DESCRIPTION: Draws a red line from (272, 85) to (452, 121).
; PLAN: r0=272(x1), r1=85(y1), r2=452(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 85
LDI r2, 452
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
