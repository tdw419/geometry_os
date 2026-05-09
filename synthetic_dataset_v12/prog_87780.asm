; DESCRIPTION: Places a magenta line segment connecting (334, 151) to (126, 119).
; PLAN: r0=334(x1), r1=151(y1), r2=126(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 151
LDI r2, 126
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
