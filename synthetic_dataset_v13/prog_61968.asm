; DESCRIPTION: Places a white line segment connecting (14, 131) to (322, 15).
; PLAN: r0=14(x1), r1=131(y1), r2=322(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 131
LDI r2, 322
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
