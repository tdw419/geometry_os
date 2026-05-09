; DESCRIPTION: Places a red line segment connecting (332, 211) to (244, 88).
; PLAN: r0=332(x1), r1=211(y1), r2=244(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 211
LDI r2, 244
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
