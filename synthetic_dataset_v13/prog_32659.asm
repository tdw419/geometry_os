; DESCRIPTION: Places a green line segment connecting (496, 156) to (485, 107).
; PLAN: r0=496(x1), r1=156(y1), r2=485(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 156
LDI r2, 485
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
