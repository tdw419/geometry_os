; DESCRIPTION: Places a yellow line segment connecting (311, 16) to (83, 44).
; PLAN: r0=311(x1), r1=16(y1), r2=83(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 16
LDI r2, 83
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
