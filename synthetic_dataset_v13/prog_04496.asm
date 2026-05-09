; DESCRIPTION: Renders a black box of size 84x19 starting at (139, 69).
; PLAN: r0=139(x), r1=69(y), r2=84(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 69
LDI r2, 84
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
