; DESCRIPTION: Renders a green box of size 96x88 starting at (53, 71).
; PLAN: r0=53(x), r1=71(y), r2=96(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 71
LDI r2, 96
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
