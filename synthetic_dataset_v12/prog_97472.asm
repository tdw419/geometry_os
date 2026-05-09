; DESCRIPTION: Renders a blue box of size 35x17 starting at (288, 62).
; PLAN: r0=288(x), r1=62(y), r2=35(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 62
LDI r2, 35
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
