; DESCRIPTION: Places a cyan line segment connecting (413, 183) to (359, 119).
; PLAN: r0=413(x1), r1=183(y1), r2=359(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 183
LDI r2, 359
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
