; DESCRIPTION: Places a red line segment connecting (416, 4) to (383, 182).
; PLAN: r0=416(x1), r1=4(y1), r2=383(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 4
LDI r2, 383
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
