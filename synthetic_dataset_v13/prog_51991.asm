; DESCRIPTION: Places a red line segment connecting (338, 100) to (381, 59).
; PLAN: r0=338(x1), r1=100(y1), r2=381(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 100
LDI r2, 381
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
