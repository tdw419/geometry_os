; DESCRIPTION: Renders a blue box of size 45x78 starting at (219, 122).
; PLAN: r0=219(x), r1=122(y), r2=45(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 122
LDI r2, 45
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
