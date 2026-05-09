; DESCRIPTION: Places a magenta line segment connecting (334, 250) to (481, 45).
; PLAN: r0=334(x1), r1=250(y1), r2=481(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 250
LDI r2, 481
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
