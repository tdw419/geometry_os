; DESCRIPTION: Renders a yellow box of size 44x89 starting at (334, 88).
; PLAN: r0=334(x), r1=88(y), r2=44(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 88
LDI r2, 44
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
