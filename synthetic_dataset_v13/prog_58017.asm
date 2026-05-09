; DESCRIPTION: Places a red line segment connecting (198, 92) to (456, 177).
; PLAN: r0=198(x1), r1=92(y1), r2=456(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 92
LDI r2, 456
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
