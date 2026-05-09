; DESCRIPTION: Places a red line segment connecting (361, 66) to (311, 92).
; PLAN: r0=361(x1), r1=66(y1), r2=311(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 66
LDI r2, 311
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
