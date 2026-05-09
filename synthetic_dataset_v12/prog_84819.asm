; DESCRIPTION: Places a red line segment connecting (306, 20) to (503, 110).
; PLAN: r0=306(x1), r1=20(y1), r2=503(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 20
LDI r2, 503
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
