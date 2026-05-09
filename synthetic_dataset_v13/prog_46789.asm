; DESCRIPTION: Places a magenta line segment connecting (129, 76) to (193, 192).
; PLAN: r0=129(x1), r1=76(y1), r2=193(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 76
LDI r2, 193
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
