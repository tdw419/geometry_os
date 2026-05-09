; DESCRIPTION: Places a red line segment connecting (200, 43) to (450, 31).
; PLAN: r0=200(x1), r1=43(y1), r2=450(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 43
LDI r2, 450
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
