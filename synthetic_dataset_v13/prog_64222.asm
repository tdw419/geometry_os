; DESCRIPTION: Renders a blue box of size 78x55 starting at (219, 30).
; PLAN: r0=219(x), r1=30(y), r2=78(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 30
LDI r2, 78
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
