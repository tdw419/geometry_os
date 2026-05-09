; DESCRIPTION: Places a magenta line segment connecting (334, 43) to (126, 12).
; PLAN: r0=334(x1), r1=43(y1), r2=126(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 43
LDI r2, 126
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
