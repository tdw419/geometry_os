; DESCRIPTION: Renders a white box of size 17x68 starting at (88, 62).
; PLAN: r0=88(x), r1=62(y), r2=17(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 62
LDI r2, 17
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
