; DESCRIPTION: Places a red line segment connecting (18, 179) to (490, 57).
; PLAN: r0=18(x1), r1=179(y1), r2=490(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 179
LDI r2, 490
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
