; DESCRIPTION: Renders a blue box of size 69x32 starting at (203, 129).
; PLAN: r0=203(x), r1=129(y), r2=69(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 129
LDI r2, 69
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
