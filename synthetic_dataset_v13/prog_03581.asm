; DESCRIPTION: Places a white line segment connecting (5, 190) to (252, 47).
; PLAN: r0=5(x1), r1=190(y1), r2=252(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 190
LDI r2, 252
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
