; DESCRIPTION: Places a white line segment connecting (81, 15) to (199, 93).
; PLAN: r0=81(x1), r1=15(y1), r2=199(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 15
LDI r2, 199
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
