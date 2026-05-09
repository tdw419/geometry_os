; DESCRIPTION: Draws a red line from (101, 225) to (343, 60).
; PLAN: r0=101(x1), r1=225(y1), r2=343(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 225
LDI r2, 343
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
