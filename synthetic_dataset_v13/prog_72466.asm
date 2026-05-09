; DESCRIPTION: Draws a red line from (468, 88) to (292, 131).
; PLAN: r0=468(x1), r1=88(y1), r2=292(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 88
LDI r2, 292
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
