; DESCRIPTION: Places a yellow line segment connecting (337, 6) to (118, 82).
; PLAN: r0=337(x1), r1=6(y1), r2=118(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 6
LDI r2, 118
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
