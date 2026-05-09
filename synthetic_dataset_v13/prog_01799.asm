; DESCRIPTION: Renders a black box of size 74x88 starting at (37, 165).
; PLAN: r0=37(x), r1=165(y), r2=74(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 165
LDI r2, 74
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
