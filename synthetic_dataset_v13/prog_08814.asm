; DESCRIPTION: Renders a black box of size 58x69 starting at (227, 53).
; PLAN: r0=227(x), r1=53(y), r2=58(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 53
LDI r2, 58
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
