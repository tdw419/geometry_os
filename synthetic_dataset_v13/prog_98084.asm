; DESCRIPTION: Places a red line segment connecting (492, 58) to (338, 96).
; PLAN: r0=492(x1), r1=58(y1), r2=338(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 58
LDI r2, 338
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
