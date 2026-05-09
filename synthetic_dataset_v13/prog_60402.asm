; DESCRIPTION: Draws a red line from (324, 162) to (134, 131).
; PLAN: r0=324(x1), r1=162(y1), r2=134(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 162
LDI r2, 134
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
