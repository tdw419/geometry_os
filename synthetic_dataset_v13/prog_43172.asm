; DESCRIPTION: Draws a red line from (56, 85) to (292, 92).
; PLAN: r0=56(x1), r1=85(y1), r2=292(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 85
LDI r2, 292
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
