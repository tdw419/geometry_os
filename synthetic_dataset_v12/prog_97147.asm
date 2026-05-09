; DESCRIPTION: Renders a yellow box of size 68x88 starting at (399, 110).
; PLAN: r0=399(x), r1=110(y), r2=68(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 110
LDI r2, 68
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
