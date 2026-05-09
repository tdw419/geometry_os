; DESCRIPTION: Renders a green box of size 64x55 starting at (227, 122).
; PLAN: r0=227(x), r1=122(y), r2=64(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 122
LDI r2, 64
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
