; DESCRIPTION: Places a red line segment connecting (288, 92) to (500, 246).
; PLAN: r0=288(x1), r1=92(y1), r2=500(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 92
LDI r2, 500
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
