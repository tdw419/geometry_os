; DESCRIPTION: Renders a black box of size 67x18 starting at (62, 131).
; PLAN: r0=62(x), r1=131(y), r2=67(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 131
LDI r2, 67
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
