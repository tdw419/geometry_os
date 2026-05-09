; DESCRIPTION: Places a red line segment connecting (81, 172) to (259, 58).
; PLAN: r0=81(x1), r1=172(y1), r2=259(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 172
LDI r2, 259
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
