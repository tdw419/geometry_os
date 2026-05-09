; DESCRIPTION: Places a red line segment connecting (81, 37) to (149, 227).
; PLAN: r0=81(x1), r1=37(y1), r2=149(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 37
LDI r2, 149
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
