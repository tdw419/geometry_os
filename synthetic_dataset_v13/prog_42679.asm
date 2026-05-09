; DESCRIPTION: Renders a black box of size 59x40 starting at (366, 69).
; PLAN: r0=366(x), r1=69(y), r2=59(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 69
LDI r2, 59
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
