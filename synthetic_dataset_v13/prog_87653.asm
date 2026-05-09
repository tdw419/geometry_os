; DESCRIPTION: Places a red line segment connecting (329, 81) to (324, 123).
; PLAN: r0=329(x1), r1=81(y1), r2=324(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 81
LDI r2, 324
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
