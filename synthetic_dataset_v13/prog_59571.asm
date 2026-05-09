; DESCRIPTION: Places a red line segment connecting (503, 220) to (65, 100).
; PLAN: r0=503(x1), r1=220(y1), r2=65(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 220
LDI r2, 65
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
