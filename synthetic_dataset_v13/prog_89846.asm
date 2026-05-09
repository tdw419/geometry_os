; DESCRIPTION: Places a red line segment connecting (48, 182) to (162, 181).
; PLAN: r0=48(x1), r1=182(y1), r2=162(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 182
LDI r2, 162
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
