; DESCRIPTION: Places a red line segment connecting (424, 64) to (421, 148).
; PLAN: r0=424(x1), r1=64(y1), r2=421(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 64
LDI r2, 421
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
