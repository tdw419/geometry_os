; DESCRIPTION: Places a red line segment connecting (269, 133) to (53, 110).
; PLAN: r0=269(x1), r1=133(y1), r2=53(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 133
LDI r2, 53
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
