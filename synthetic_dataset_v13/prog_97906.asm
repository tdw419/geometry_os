; DESCRIPTION: Places a red line segment connecting (67, 131) to (140, 191).
; PLAN: r0=67(x1), r1=131(y1), r2=140(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 131
LDI r2, 140
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
