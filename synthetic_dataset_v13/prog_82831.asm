; DESCRIPTION: Places a red line segment connecting (401, 49) to (314, 115).
; PLAN: r0=401(x1), r1=49(y1), r2=314(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 49
LDI r2, 314
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
