; DESCRIPTION: Places a yellow line segment connecting (129, 42) to (103, 199).
; PLAN: r0=129(x1), r1=42(y1), r2=103(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 42
LDI r2, 103
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
