; DESCRIPTION: Places a magenta line segment connecting (26, 246) to (40, 59).
; PLAN: r0=26(x1), r1=246(y1), r2=40(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 246
LDI r2, 40
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
