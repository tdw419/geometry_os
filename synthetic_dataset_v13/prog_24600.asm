; DESCRIPTION: Places a red line segment connecting (377, 75) to (375, 18).
; PLAN: r0=377(x1), r1=75(y1), r2=375(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 75
LDI r2, 375
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
