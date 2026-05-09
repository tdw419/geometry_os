; DESCRIPTION: Draws a red line from (419, 87) to (134, 214).
; PLAN: r0=419(x1), r1=87(y1), r2=134(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 87
LDI r2, 134
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
