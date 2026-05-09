; DESCRIPTION: Places a red line segment connecting (405, 36) to (129, 121).
; PLAN: r0=405(x1), r1=36(y1), r2=129(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 36
LDI r2, 129
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
