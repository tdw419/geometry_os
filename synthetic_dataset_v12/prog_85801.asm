; DESCRIPTION: Places a red line segment connecting (491, 149) to (22, 232).
; PLAN: r0=491(x1), r1=149(y1), r2=22(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 149
LDI r2, 22
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
