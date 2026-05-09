; DESCRIPTION: Places a magenta line segment connecting (161, 143) to (156, 131).
; PLAN: r0=161(x1), r1=143(y1), r2=156(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 143
LDI r2, 156
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
