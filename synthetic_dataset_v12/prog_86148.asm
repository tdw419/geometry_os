; DESCRIPTION: Places a red line segment connecting (67, 64) to (285, 76).
; PLAN: r0=67(x1), r1=64(y1), r2=285(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 64
LDI r2, 285
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
