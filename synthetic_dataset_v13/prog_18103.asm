; DESCRIPTION: Places a red line segment connecting (105, 101) to (241, 164).
; PLAN: r0=105(x1), r1=101(y1), r2=241(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 101
LDI r2, 241
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
