; DESCRIPTION: Places a red line segment connecting (372, 106) to (93, 87).
; PLAN: r0=372(x1), r1=106(y1), r2=93(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 106
LDI r2, 93
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
