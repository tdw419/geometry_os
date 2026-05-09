; DESCRIPTION: Places a magenta line segment connecting (184, 56) to (62, 210).
; PLAN: r0=184(x1), r1=56(y1), r2=62(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 56
LDI r2, 62
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
