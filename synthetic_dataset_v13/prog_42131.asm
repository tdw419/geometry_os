; DESCRIPTION: Places a red line segment connecting (291, 104) to (141, 47).
; PLAN: r0=291(x1), r1=104(y1), r2=141(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 104
LDI r2, 141
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
