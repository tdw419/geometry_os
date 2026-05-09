; DESCRIPTION: Places a red line segment connecting (58, 76) to (418, 244).
; PLAN: r0=58(x1), r1=76(y1), r2=418(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 76
LDI r2, 418
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
