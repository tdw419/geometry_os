; DESCRIPTION: Places a red line segment connecting (503, 0) to (179, 5).
; PLAN: r0=503(x1), r1=0(y1), r2=179(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 0
LDI r2, 179
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
