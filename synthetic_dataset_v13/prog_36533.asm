; DESCRIPTION: Places a red line segment connecting (236, 16) to (421, 80).
; PLAN: r0=236(x1), r1=16(y1), r2=421(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 16
LDI r2, 421
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
