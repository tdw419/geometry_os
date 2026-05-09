; DESCRIPTION: Renders a black box of size 88x75 starting at (13, 165).
; PLAN: r0=13(x), r1=165(y), r2=88(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 165
LDI r2, 88
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
