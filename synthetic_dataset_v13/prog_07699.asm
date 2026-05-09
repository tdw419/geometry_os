; DESCRIPTION: Places a magenta line segment connecting (149, 143) to (58, 26).
; PLAN: r0=149(x1), r1=143(y1), r2=58(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 143
LDI r2, 58
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
