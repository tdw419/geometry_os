; DESCRIPTION: Renders a purple box of size 102x88 starting at (17, 127).
; PLAN: r0=17(x), r1=127(y), r2=102(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 127
LDI r2, 102
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
