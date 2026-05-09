; DESCRIPTION: Renders a magenta box of size 49x67 starting at (17, 87).
; PLAN: r0=17(x), r1=87(y), r2=49(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 87
LDI r2, 49
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
