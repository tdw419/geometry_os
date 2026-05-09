; DESCRIPTION: Places a red line segment connecting (100, 46) to (263, 129).
; PLAN: r0=100(x1), r1=46(y1), r2=263(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 46
LDI r2, 263
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
