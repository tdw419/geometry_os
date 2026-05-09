; DESCRIPTION: Places a red line segment connecting (76, 223) to (457, 226).
; PLAN: r0=76(x1), r1=223(y1), r2=457(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 223
LDI r2, 457
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
