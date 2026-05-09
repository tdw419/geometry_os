; DESCRIPTION: Places a red line segment connecting (314, 146) to (270, 96).
; PLAN: r0=314(x1), r1=146(y1), r2=270(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 146
LDI r2, 270
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
