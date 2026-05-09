; DESCRIPTION: Places a red line segment connecting (291, 32) to (468, 179).
; PLAN: r0=291(x1), r1=32(y1), r2=468(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 32
LDI r2, 468
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
