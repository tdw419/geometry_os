; DESCRIPTION: Places a red line segment connecting (414, 13) to (467, 69).
; PLAN: r0=414(x1), r1=13(y1), r2=467(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 13
LDI r2, 467
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
