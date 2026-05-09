; DESCRIPTION: Draws a red line from (35, 100) to (178, 182).
; PLAN: r0=35(x1), r1=100(y1), r2=178(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 100
LDI r2, 178
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
