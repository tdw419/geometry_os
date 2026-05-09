; DESCRIPTION: Renders a blue box of size 76x54 starting at (402, 67).
; PLAN: r0=402(x), r1=67(y), r2=76(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 67
LDI r2, 76
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
