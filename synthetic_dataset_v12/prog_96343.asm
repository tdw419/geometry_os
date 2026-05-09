; DESCRIPTION: Places a red line segment connecting (239, 194) to (201, 96).
; PLAN: r0=239(x1), r1=194(y1), r2=201(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 194
LDI r2, 201
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
