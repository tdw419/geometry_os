; DESCRIPTION: Renders a black box of size 21x69 starting at (324, 53).
; PLAN: r0=324(x), r1=53(y), r2=21(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 53
LDI r2, 21
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
