; DESCRIPTION: Places a white line segment connecting (65, 139) to (413, 252).
; PLAN: r0=65(x1), r1=139(y1), r2=413(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 139
LDI r2, 413
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
