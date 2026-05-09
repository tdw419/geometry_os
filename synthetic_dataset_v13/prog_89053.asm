; DESCRIPTION: Renders a blue box of size 76x20 starting at (318, 165).
; PLAN: r0=318(x), r1=165(y), r2=76(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 165
LDI r2, 76
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
