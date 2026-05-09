; DESCRIPTION: Places a black line segment connecting (401, 130) to (17, 109).
; PLAN: r0=401(x1), r1=130(y1), r2=17(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 130
LDI r2, 17
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
