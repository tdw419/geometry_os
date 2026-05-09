; DESCRIPTION: Places a red line segment connecting (195, 1) to (412, 36).
; PLAN: r0=195(x1), r1=1(y1), r2=412(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 1
LDI r2, 412
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
