; DESCRIPTION: Draws a red line from (295, 101) to (419, 78).
; PLAN: r0=295(x1), r1=101(y1), r2=419(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 101
LDI r2, 419
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
