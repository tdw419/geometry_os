; DESCRIPTION: Places a yellow line segment connecting (485, 58) to (188, 10).
; PLAN: r0=485(x1), r1=58(y1), r2=188(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 58
LDI r2, 188
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
