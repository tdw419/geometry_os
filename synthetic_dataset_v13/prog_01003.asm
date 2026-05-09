; DESCRIPTION: Places a red line segment connecting (375, 242) to (407, 74).
; PLAN: r0=375(x1), r1=242(y1), r2=407(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 242
LDI r2, 407
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
