; DESCRIPTION: Renders a red line between points (447, 60) and (375, 84).
; PLAN: r0=447(x1), r1=60(y1), r2=375(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 60
LDI r2, 375
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
