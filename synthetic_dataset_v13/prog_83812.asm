; DESCRIPTION: Places a red line segment connecting (364, 214) to (149, 69).
; PLAN: r0=364(x1), r1=214(y1), r2=149(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 214
LDI r2, 149
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
