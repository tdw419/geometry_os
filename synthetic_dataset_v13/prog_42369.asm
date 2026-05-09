; DESCRIPTION: Places a red line segment connecting (227, 174) to (12, 162).
; PLAN: r0=227(x1), r1=174(y1), r2=12(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 174
LDI r2, 12
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
