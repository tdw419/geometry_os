; DESCRIPTION: Places a green line segment connecting (80, 241) to (383, 7).
; PLAN: r0=80(x1), r1=241(y1), r2=383(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 241
LDI r2, 383
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
