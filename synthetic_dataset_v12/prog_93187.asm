; DESCRIPTION: Places a magenta line segment connecting (399, 23) to (178, 21).
; PLAN: r0=399(x1), r1=23(y1), r2=178(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 23
LDI r2, 178
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
