; DESCRIPTION: Places a red line segment connecting (103, 192) to (30, 31).
; PLAN: r0=103(x1), r1=192(y1), r2=30(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 192
LDI r2, 30
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
