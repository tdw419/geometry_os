; DESCRIPTION: Places a yellow line segment connecting (79, 0) to (21, 101).
; PLAN: r0=79(x1), r1=0(y1), r2=21(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 0
LDI r2, 21
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
