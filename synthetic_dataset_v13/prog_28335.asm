; DESCRIPTION: Renders a purple box of size 69x37 starting at (22, 11).
; PLAN: r0=22(x), r1=11(y), r2=69(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 11
LDI r2, 69
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
