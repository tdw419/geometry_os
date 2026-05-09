; DESCRIPTION: Places a red line segment connecting (125, 233) to (379, 38).
; PLAN: r0=125(x1), r1=233(y1), r2=379(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 233
LDI r2, 379
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
