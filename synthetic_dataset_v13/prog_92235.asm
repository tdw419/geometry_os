; DESCRIPTION: Renders a blue box of size 19x28 starting at (238, 53).
; PLAN: r0=238(x), r1=53(y), r2=19(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 53
LDI r2, 19
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
