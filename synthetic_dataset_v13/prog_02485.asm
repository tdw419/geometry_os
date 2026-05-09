; DESCRIPTION: Places a red line segment connecting (399, 0) to (69, 183).
; PLAN: r0=399(x1), r1=0(y1), r2=69(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 0
LDI r2, 69
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
