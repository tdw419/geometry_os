; DESCRIPTION: Renders a black box of size 35x91 starting at (49, 138).
; PLAN: r0=49(x), r1=138(y), r2=35(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 138
LDI r2, 35
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
