; DESCRIPTION: Places a magenta line segment connecting (35, 189) to (183, 192).
; PLAN: r0=35(x1), r1=189(y1), r2=183(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 189
LDI r2, 183
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
