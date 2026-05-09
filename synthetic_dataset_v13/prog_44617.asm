; DESCRIPTION: Renders a black box of size 58x101 starting at (49, 94).
; PLAN: r0=49(x), r1=94(y), r2=58(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 94
LDI r2, 58
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
