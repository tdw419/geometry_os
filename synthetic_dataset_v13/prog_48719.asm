; DESCRIPTION: Places a red line segment connecting (457, 88) to (351, 174).
; PLAN: r0=457(x1), r1=88(y1), r2=351(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 88
LDI r2, 351
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
