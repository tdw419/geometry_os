; DESCRIPTION: Draws a red line from (236, 170) to (120, 122).
; PLAN: r0=236(x1), r1=170(y1), r2=120(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 170
LDI r2, 120
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
