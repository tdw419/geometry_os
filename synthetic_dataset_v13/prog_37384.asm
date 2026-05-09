; DESCRIPTION: Places a magenta line segment connecting (229, 244) to (375, 192).
; PLAN: r0=229(x1), r1=244(y1), r2=375(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 244
LDI r2, 375
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
