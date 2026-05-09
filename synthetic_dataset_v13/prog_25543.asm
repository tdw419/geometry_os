; DESCRIPTION: Places a red line segment connecting (76, 230) to (434, 245).
; PLAN: r0=76(x1), r1=230(y1), r2=434(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 230
LDI r2, 434
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
