; DESCRIPTION: Draws a red line from (143, 31) to (155, 60).
; PLAN: r0=143(x1), r1=31(y1), r2=155(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 31
LDI r2, 155
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
