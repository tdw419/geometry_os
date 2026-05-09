; DESCRIPTION: Places a green line segment connecting (234, 156) to (219, 141).
; PLAN: r0=234(x1), r1=156(y1), r2=219(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 156
LDI r2, 219
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
