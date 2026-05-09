; DESCRIPTION: Places a red line segment connecting (403, 4) to (133, 114).
; PLAN: r0=403(x1), r1=4(y1), r2=133(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 4
LDI r2, 133
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
