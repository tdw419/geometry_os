; DESCRIPTION: Places a red line segment connecting (437, 107) to (459, 84).
; PLAN: r0=437(x1), r1=107(y1), r2=459(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 107
LDI r2, 459
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
