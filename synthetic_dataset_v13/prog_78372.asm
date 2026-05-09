; DESCRIPTION: Places a red line segment connecting (399, 204) to (161, 9).
; PLAN: r0=399(x1), r1=204(y1), r2=161(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 204
LDI r2, 161
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
