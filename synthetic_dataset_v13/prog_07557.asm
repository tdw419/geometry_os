; DESCRIPTION: Places a yellow line segment connecting (30, 153) to (28, 68).
; PLAN: r0=30(x1), r1=153(y1), r2=28(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 153
LDI r2, 28
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
