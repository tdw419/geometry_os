; DESCRIPTION: Places a red line segment connecting (403, 242) to (423, 122).
; PLAN: r0=403(x1), r1=242(y1), r2=423(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 242
LDI r2, 423
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
