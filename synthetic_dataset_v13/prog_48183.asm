; DESCRIPTION: Places a white line segment connecting (379, 93) to (162, 244).
; PLAN: r0=379(x1), r1=93(y1), r2=162(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 93
LDI r2, 162
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
