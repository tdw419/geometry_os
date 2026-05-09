; DESCRIPTION: Places a magenta line segment connecting (59, 226) to (74, 205).
; PLAN: r0=59(x1), r1=226(y1), r2=74(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 226
LDI r2, 74
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
