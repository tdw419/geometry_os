; DESCRIPTION: Places a red line segment connecting (161, 68) to (474, 78).
; PLAN: r0=161(x1), r1=68(y1), r2=474(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 68
LDI r2, 474
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
