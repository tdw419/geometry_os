; DESCRIPTION: Renders a purple box of size 108x49 starting at (234, 62).
; PLAN: r0=234(x), r1=62(y), r2=108(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 62
LDI r2, 108
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
