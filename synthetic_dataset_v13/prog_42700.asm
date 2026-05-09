; DESCRIPTION: Places a red line segment connecting (421, 74) to (85, 13).
; PLAN: r0=421(x1), r1=74(y1), r2=85(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 74
LDI r2, 85
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
