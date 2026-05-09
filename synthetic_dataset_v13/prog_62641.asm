; DESCRIPTION: Places a red line segment connecting (387, 53) to (22, 98).
; PLAN: r0=387(x1), r1=53(y1), r2=22(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 53
LDI r2, 22
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
