; DESCRIPTION: Renders a purple box of size 13x88 starting at (421, 35).
; PLAN: r0=421(x), r1=35(y), r2=13(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 35
LDI r2, 13
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
