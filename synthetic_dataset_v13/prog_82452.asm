; DESCRIPTION: Places a magenta line segment connecting (25, 143) to (93, 17).
; PLAN: r0=25(x1), r1=143(y1), r2=93(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 143
LDI r2, 93
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
