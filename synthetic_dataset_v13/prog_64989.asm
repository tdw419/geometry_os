; DESCRIPTION: Renders a purple box of size 69x39 starting at (109, 88).
; PLAN: r0=109(x), r1=88(y), r2=69(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 88
LDI r2, 69
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
