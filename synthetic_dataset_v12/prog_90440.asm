; DESCRIPTION: Places a red line segment connecting (413, 207) to (375, 83).
; PLAN: r0=413(x1), r1=207(y1), r2=375(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 207
LDI r2, 375
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
