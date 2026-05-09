; DESCRIPTION: Draws a red line from (343, 186) to (33, 212).
; PLAN: r0=343(x1), r1=186(y1), r2=33(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 186
LDI r2, 33
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
