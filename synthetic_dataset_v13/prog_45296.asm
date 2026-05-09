; DESCRIPTION: Places a orange line segment connecting (344, 120) to (141, 168).
; PLAN: r0=344(x1), r1=120(y1), r2=141(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 120
LDI r2, 141
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
