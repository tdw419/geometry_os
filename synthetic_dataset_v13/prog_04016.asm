; DESCRIPTION: Renders a blue box of size 69x43 starting at (178, 104).
; PLAN: r0=178(x), r1=104(y), r2=69(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 104
LDI r2, 69
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
