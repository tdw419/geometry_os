; DESCRIPTION: Draws a red line from (282, 87) to (359, 217).
; PLAN: r0=282(x1), r1=87(y1), r2=359(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 87
LDI r2, 359
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
