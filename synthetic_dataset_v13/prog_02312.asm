; DESCRIPTION: Places a red line segment connecting (101, 6) to (468, 195).
; PLAN: r0=101(x1), r1=6(y1), r2=468(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 6
LDI r2, 468
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
