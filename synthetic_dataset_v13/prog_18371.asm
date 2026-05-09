; DESCRIPTION: Draws a red line from (75, 109) to (134, 81).
; PLAN: r0=75(x1), r1=109(y1), r2=134(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 109
LDI r2, 134
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
