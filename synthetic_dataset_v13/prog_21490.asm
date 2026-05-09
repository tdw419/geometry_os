; DESCRIPTION: Places a white line segment connecting (37, 116) to (413, 91).
; PLAN: r0=37(x1), r1=116(y1), r2=413(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 116
LDI r2, 413
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
