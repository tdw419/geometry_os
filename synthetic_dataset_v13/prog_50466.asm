; DESCRIPTION: Places a red line segment connecting (35, 122) to (35, 131).
; PLAN: r0=35(x1), r1=122(y1), r2=35(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 122
LDI r2, 35
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
