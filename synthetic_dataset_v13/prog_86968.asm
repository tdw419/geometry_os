; DESCRIPTION: Places a red line segment connecting (16, 76) to (361, 1).
; PLAN: r0=16(x1), r1=76(y1), r2=361(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 76
LDI r2, 361
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
