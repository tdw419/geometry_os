; DESCRIPTION: Places a magenta line segment connecting (258, 233) to (299, 1).
; PLAN: r0=258(x1), r1=233(y1), r2=299(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 233
LDI r2, 299
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
