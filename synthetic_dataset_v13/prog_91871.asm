; DESCRIPTION: Places a red line segment connecting (456, 115) to (179, 61).
; PLAN: r0=456(x1), r1=115(y1), r2=179(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 115
LDI r2, 179
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
