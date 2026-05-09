; DESCRIPTION: Draws a red line from (212, 138) to (461, 49).
; PLAN: r0=212(x1), r1=138(y1), r2=461(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 138
LDI r2, 461
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
