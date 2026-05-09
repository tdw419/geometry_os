; DESCRIPTION: Renders a purple box of size 56x35 starting at (17, 101).
; PLAN: r0=17(x), r1=101(y), r2=56(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 101
LDI r2, 56
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
