; DESCRIPTION: Renders a purple box of size 62x17 starting at (101, 127).
; PLAN: r0=101(x), r1=127(y), r2=62(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 127
LDI r2, 62
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
