; DESCRIPTION: Places a magenta line segment connecting (59, 66) to (505, 153).
; PLAN: r0=59(x1), r1=66(y1), r2=505(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 66
LDI r2, 505
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
