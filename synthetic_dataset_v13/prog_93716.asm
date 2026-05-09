; DESCRIPTION: Places a red line segment connecting (322, 176) to (343, 10).
; PLAN: r0=322(x1), r1=176(y1), r2=343(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 176
LDI r2, 343
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
