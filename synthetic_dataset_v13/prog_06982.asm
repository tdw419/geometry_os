; DESCRIPTION: Places a red line segment connecting (188, 92) to (461, 69).
; PLAN: r0=188(x1), r1=92(y1), r2=461(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 92
LDI r2, 461
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
