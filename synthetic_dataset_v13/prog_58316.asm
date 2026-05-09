; DESCRIPTION: Places a red line segment connecting (76, 137) to (38, 133).
; PLAN: r0=76(x1), r1=137(y1), r2=38(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 137
LDI r2, 38
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
