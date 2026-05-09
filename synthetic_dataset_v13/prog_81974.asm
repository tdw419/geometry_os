; DESCRIPTION: Places a white line segment connecting (413, 146) to (343, 248).
; PLAN: r0=413(x1), r1=146(y1), r2=343(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 146
LDI r2, 343
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
