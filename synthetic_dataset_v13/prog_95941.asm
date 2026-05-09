; DESCRIPTION: Places a red line segment connecting (232, 58) to (127, 120).
; PLAN: r0=232(x1), r1=58(y1), r2=127(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 58
LDI r2, 127
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
