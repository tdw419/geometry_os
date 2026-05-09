; DESCRIPTION: Places a yellow line segment connecting (454, 158) to (21, 42).
; PLAN: r0=454(x1), r1=158(y1), r2=21(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 158
LDI r2, 21
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
