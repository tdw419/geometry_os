; DESCRIPTION: Places a red line segment connecting (297, 117) to (133, 32).
; PLAN: r0=297(x1), r1=117(y1), r2=133(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 117
LDI r2, 133
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
