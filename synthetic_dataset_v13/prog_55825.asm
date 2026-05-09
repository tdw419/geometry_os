; DESCRIPTION: Renders a yellow box of size 14x105 starting at (184, 88).
; PLAN: r0=184(x), r1=88(y), r2=14(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 88
LDI r2, 14
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
