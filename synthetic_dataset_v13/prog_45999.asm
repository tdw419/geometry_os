; DESCRIPTION: Renders a yellow box of size 117x88 starting at (227, 47).
; PLAN: r0=227(x), r1=47(y), r2=117(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 47
LDI r2, 117
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
