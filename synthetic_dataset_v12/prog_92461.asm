; DESCRIPTION: Places a magenta line segment connecting (329, 96) to (189, 23).
; PLAN: r0=329(x1), r1=96(y1), r2=189(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 96
LDI r2, 189
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
