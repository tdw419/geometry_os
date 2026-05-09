; DESCRIPTION: Renders a black box of size 88x53 starting at (38, 67).
; PLAN: r0=38(x), r1=67(y), r2=88(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 67
LDI r2, 88
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
