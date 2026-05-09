; DESCRIPTION: Renders a blue box of size 62x55 starting at (324, 7).
; PLAN: r0=324(x), r1=7(y), r2=62(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 7
LDI r2, 62
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
