; DESCRIPTION: Renders a purple box of size 74x26 starting at (69, 101).
; PLAN: r0=69(x), r1=101(y), r2=74(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 101
LDI r2, 74
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
