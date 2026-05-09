; DESCRIPTION: Draws a red line from (178, 109) to (412, 102).
; PLAN: r0=178(x1), r1=109(y1), r2=412(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 109
LDI r2, 412
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
