; DESCRIPTION: Places a magenta line segment connecting (57, 108) to (271, 101).
; PLAN: r0=57(x1), r1=108(y1), r2=271(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 108
LDI r2, 271
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
