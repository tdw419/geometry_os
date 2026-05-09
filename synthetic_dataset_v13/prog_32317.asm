; DESCRIPTION: Places a red line segment connecting (53, 241) to (212, 184).
; PLAN: r0=53(x1), r1=241(y1), r2=212(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 241
LDI r2, 212
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
