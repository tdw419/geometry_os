; DESCRIPTION: Places a red line segment connecting (0, 143) to (53, 67).
; PLAN: r0=0(x1), r1=143(y1), r2=53(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 143
LDI r2, 53
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
