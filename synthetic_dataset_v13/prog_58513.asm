; DESCRIPTION: Places a cyan line segment connecting (199, 100) to (413, 19).
; PLAN: r0=199(x1), r1=100(y1), r2=413(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 100
LDI r2, 413
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
