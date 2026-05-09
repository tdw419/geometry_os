; DESCRIPTION: Draws a red line from (419, 33) to (95, 178).
; PLAN: r0=419(x1), r1=33(y1), r2=95(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 33
LDI r2, 95
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
