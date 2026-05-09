; DESCRIPTION: Places a orange line segment connecting (327, 130) to (314, 134).
; PLAN: r0=327(x1), r1=130(y1), r2=314(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 130
LDI r2, 314
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
