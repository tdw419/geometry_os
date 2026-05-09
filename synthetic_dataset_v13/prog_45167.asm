; DESCRIPTION: Places a red line segment connecting (187, 15) to (141, 1).
; PLAN: r0=187(x1), r1=15(y1), r2=141(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 15
LDI r2, 141
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
