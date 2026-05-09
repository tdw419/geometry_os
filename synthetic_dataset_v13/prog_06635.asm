; DESCRIPTION: Places a red line segment connecting (361, 53) to (449, 162).
; PLAN: r0=361(x1), r1=53(y1), r2=449(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 53
LDI r2, 449
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
