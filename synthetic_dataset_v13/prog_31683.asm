; DESCRIPTION: Places a magenta line segment connecting (413, 225) to (128, 11).
; PLAN: r0=413(x1), r1=225(y1), r2=128(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 225
LDI r2, 128
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
