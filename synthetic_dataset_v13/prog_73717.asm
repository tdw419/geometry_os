; DESCRIPTION: Places a white line segment connecting (28, 101) to (199, 91).
; PLAN: r0=28(x1), r1=101(y1), r2=199(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 101
LDI r2, 199
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
