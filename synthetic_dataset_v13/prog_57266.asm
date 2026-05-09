; DESCRIPTION: Renders a blue box of size 88x98 starting at (278, 62).
; PLAN: r0=278(x), r1=62(y), r2=88(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 62
LDI r2, 88
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
