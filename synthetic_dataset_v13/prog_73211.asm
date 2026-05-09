; DESCRIPTION: Draws a red line from (483, 37) to (120, 116).
; PLAN: r0=483(x1), r1=37(y1), r2=120(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 37
LDI r2, 120
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
