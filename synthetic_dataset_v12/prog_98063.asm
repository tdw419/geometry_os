; DESCRIPTION: Places a magenta line segment connecting (463, 178) to (15, 192).
; PLAN: r0=463(x1), r1=178(y1), r2=15(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 178
LDI r2, 15
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
