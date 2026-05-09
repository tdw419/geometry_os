; DESCRIPTION: Places a yellow line segment connecting (311, 94) to (143, 153).
; PLAN: r0=311(x1), r1=94(y1), r2=143(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 94
LDI r2, 143
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
