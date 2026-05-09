; DESCRIPTION: Places a red line segment connecting (457, 31) to (179, 55).
; PLAN: r0=457(x1), r1=31(y1), r2=179(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 31
LDI r2, 179
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
