; DESCRIPTION: Places a red line segment connecting (283, 148) to (424, 25).
; PLAN: r0=283(x1), r1=148(y1), r2=424(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 148
LDI r2, 424
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
