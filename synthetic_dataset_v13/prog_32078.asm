; DESCRIPTION: Renders a purple box of size 69x101 starting at (57, 108).
; PLAN: r0=57(x), r1=108(y), r2=69(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 108
LDI r2, 69
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
