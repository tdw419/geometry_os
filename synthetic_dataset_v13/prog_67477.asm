; DESCRIPTION: Places a red line segment connecting (101, 58) to (183, 192).
; PLAN: r0=101(x1), r1=58(y1), r2=183(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 58
LDI r2, 183
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
