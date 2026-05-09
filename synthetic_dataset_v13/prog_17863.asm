; DESCRIPTION: Places a green line segment connecting (188, 157) to (485, 51).
; PLAN: r0=188(x1), r1=157(y1), r2=485(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 157
LDI r2, 485
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
