; DESCRIPTION: Draws a red line from (138, 138) to (31, 162).
; PLAN: r0=138(x1), r1=138(y1), r2=31(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 138
LDI r2, 31
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
