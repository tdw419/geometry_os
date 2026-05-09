; DESCRIPTION: Places a magenta line segment connecting (413, 255) to (34, 59).
; PLAN: r0=413(x1), r1=255(y1), r2=34(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 255
LDI r2, 34
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
