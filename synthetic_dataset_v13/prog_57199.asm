; DESCRIPTION: Renders a blue box of size 17x92 starting at (67, 43).
; PLAN: r0=67(x), r1=43(y), r2=17(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 43
LDI r2, 17
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
