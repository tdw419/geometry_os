; DESCRIPTION: Places a magenta line segment connecting (413, 32) to (245, 74).
; PLAN: r0=413(x1), r1=32(y1), r2=245(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 32
LDI r2, 245
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
