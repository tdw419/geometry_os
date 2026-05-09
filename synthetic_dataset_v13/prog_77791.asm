; DESCRIPTION: Renders a black box of size 34x91 starting at (25, 88).
; PLAN: r0=25(x), r1=88(y), r2=34(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 88
LDI r2, 34
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
