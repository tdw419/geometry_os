; DESCRIPTION: Places a red line segment connecting (2, 92) to (400, 57).
; PLAN: r0=2(x1), r1=92(y1), r2=400(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 92
LDI r2, 400
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
