; DESCRIPTION: Draws a red line from (9, 250) to (10, 232).
; PLAN: r0=9(x1), r1=250(y1), r2=10(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 250
LDI r2, 10
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
