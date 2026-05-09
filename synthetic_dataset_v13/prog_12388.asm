; DESCRIPTION: Places a red line segment connecting (84, 25) to (383, 115).
; PLAN: r0=84(x1), r1=25(y1), r2=383(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 25
LDI r2, 383
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
