; DESCRIPTION: Places a red line segment connecting (401, 102) to (292, 223).
; PLAN: r0=401(x1), r1=102(y1), r2=292(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 102
LDI r2, 292
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
