; DESCRIPTION: Places a red line segment connecting (200, 183) to (317, 69).
; PLAN: r0=200(x1), r1=183(y1), r2=317(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 183
LDI r2, 317
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
