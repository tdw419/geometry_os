; DESCRIPTION: Draws a red line from (461, 247) to (132, 102).
; PLAN: r0=461(x1), r1=247(y1), r2=132(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 247
LDI r2, 132
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
