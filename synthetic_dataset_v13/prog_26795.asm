; DESCRIPTION: Places a red line segment connecting (510, 136) to (285, 80).
; PLAN: r0=510(x1), r1=136(y1), r2=285(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 136
LDI r2, 285
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
