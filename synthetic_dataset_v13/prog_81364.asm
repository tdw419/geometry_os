; DESCRIPTION: Places a red line segment connecting (61, 69) to (503, 120).
; PLAN: r0=61(x1), r1=69(y1), r2=503(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 69
LDI r2, 503
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
