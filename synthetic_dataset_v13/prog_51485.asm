; DESCRIPTION: Places a red line segment connecting (47, 214) to (396, 67).
; PLAN: r0=47(x1), r1=214(y1), r2=396(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 214
LDI r2, 396
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
