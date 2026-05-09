; DESCRIPTION: Places a red line segment connecting (462, 58) to (291, 230).
; PLAN: r0=462(x1), r1=58(y1), r2=291(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 58
LDI r2, 291
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
