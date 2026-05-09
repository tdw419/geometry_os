; DESCRIPTION: Places a green line segment connecting (332, 161) to (153, 116).
; PLAN: r0=332(x1), r1=161(y1), r2=153(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 161
LDI r2, 153
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
