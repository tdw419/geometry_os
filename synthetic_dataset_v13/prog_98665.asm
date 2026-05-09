; DESCRIPTION: Places a red line segment connecting (313, 150) to (467, 49).
; PLAN: r0=313(x1), r1=150(y1), r2=467(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 150
LDI r2, 467
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
