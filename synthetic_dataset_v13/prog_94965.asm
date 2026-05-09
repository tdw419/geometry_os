; DESCRIPTION: Renders a purple box of size 82x62 starting at (170, 69).
; PLAN: r0=170(x), r1=69(y), r2=82(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 69
LDI r2, 82
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
