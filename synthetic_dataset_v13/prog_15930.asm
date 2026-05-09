; DESCRIPTION: Places a red line segment connecting (460, 232) to (396, 217).
; PLAN: r0=460(x1), r1=232(y1), r2=396(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 232
LDI r2, 396
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
