; DESCRIPTION: Places a green line segment connecting (485, 44) to (111, 247).
; PLAN: r0=485(x1), r1=44(y1), r2=111(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 44
LDI r2, 111
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
