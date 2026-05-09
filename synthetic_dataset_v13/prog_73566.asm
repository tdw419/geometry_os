; DESCRIPTION: Renders a blue box of size 69x101 starting at (136, 109).
; PLAN: r0=136(x), r1=109(y), r2=69(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 109
LDI r2, 69
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
