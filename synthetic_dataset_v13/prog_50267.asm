; DESCRIPTION: Places a red line segment connecting (424, 45) to (24, 191).
; PLAN: r0=424(x1), r1=45(y1), r2=24(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 45
LDI r2, 24
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
