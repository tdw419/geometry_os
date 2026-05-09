; DESCRIPTION: Renders a blue box of size 69x15 starting at (399, 232).
; PLAN: r0=399(x), r1=232(y), r2=69(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 232
LDI r2, 69
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
