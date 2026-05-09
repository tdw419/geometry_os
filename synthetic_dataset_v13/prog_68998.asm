; DESCRIPTION: Places a magenta line segment connecting (327, 23) to (43, 168).
; PLAN: r0=327(x1), r1=23(y1), r2=43(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 23
LDI r2, 43
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
