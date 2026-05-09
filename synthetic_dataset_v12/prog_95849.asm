; DESCRIPTION: Places a cyan line segment connecting (199, 81) to (119, 184).
; PLAN: r0=199(x1), r1=81(y1), r2=119(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 81
LDI r2, 119
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
