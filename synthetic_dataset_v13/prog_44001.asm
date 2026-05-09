; DESCRIPTION: Places a magenta line segment connecting (271, 134) to (59, 206).
; PLAN: r0=271(x1), r1=134(y1), r2=59(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 134
LDI r2, 59
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
