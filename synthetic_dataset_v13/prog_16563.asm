; DESCRIPTION: Places a green line segment connecting (90, 77) to (485, 245).
; PLAN: r0=90(x1), r1=77(y1), r2=485(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 77
LDI r2, 485
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
