; DESCRIPTION: Renders a blue box of size 100x97 starting at (364, 88).
; PLAN: r0=364(x), r1=88(y), r2=100(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 88
LDI r2, 100
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
