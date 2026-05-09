; DESCRIPTION: Renders a purple box of size 49x54 starting at (407, 88).
; PLAN: r0=407(x), r1=88(y), r2=49(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 88
LDI r2, 49
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
