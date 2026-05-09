; DESCRIPTION: Renders a yellow box of size 74x88 starting at (414, 37).
; PLAN: r0=414(x), r1=37(y), r2=74(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 37
LDI r2, 74
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
