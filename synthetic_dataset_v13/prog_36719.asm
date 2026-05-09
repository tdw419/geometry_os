; DESCRIPTION: Places a magenta line segment connecting (511, 80) to (414, 204).
; PLAN: r0=511(x1), r1=80(y1), r2=414(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 80
LDI r2, 414
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
