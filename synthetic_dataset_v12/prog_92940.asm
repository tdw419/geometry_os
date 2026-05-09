; DESCRIPTION: Places a orange line segment connecting (423, 32) to (380, 179).
; PLAN: r0=423(x1), r1=32(y1), r2=380(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 32
LDI r2, 380
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
