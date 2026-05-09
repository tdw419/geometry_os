; DESCRIPTION: Places a yellow line segment connecting (485, 163) to (384, 92).
; PLAN: r0=485(x1), r1=163(y1), r2=384(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 163
LDI r2, 384
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
