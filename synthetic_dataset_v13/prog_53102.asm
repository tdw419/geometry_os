; DESCRIPTION: Places a red line segment connecting (375, 25) to (358, 240).
; PLAN: r0=375(x1), r1=25(y1), r2=358(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 25
LDI r2, 358
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
