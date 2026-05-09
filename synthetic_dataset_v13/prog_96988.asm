; DESCRIPTION: Places a yellow line segment connecting (49, 179) to (329, 153).
; PLAN: r0=49(x1), r1=179(y1), r2=329(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 179
LDI r2, 329
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
