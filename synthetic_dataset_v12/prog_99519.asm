; DESCRIPTION: Places a red line segment connecting (265, 1) to (324, 0).
; PLAN: r0=265(x1), r1=1(y1), r2=324(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 1
LDI r2, 324
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
