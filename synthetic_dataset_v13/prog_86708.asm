; DESCRIPTION: Places a red line segment connecting (403, 200) to (7, 179).
; PLAN: r0=403(x1), r1=200(y1), r2=7(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 200
LDI r2, 7
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
