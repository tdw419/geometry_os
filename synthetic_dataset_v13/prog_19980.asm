; DESCRIPTION: Places a yellow line segment connecting (103, 22) to (61, 56).
; PLAN: r0=103(x1), r1=22(y1), r2=61(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 22
LDI r2, 61
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
