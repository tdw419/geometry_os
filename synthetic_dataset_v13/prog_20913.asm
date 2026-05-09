; DESCRIPTION: Places a red line segment connecting (500, 189) to (58, 21).
; PLAN: r0=500(x1), r1=189(y1), r2=58(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 189
LDI r2, 58
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
