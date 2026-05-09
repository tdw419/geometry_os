; DESCRIPTION: Renders a yellow box of size 58x88 starting at (160, 6).
; PLAN: r0=160(x), r1=6(y), r2=58(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 6
LDI r2, 58
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
