; DESCRIPTION: Renders a blue box of size 62x69 starting at (344, 183).
; PLAN: r0=344(x), r1=183(y), r2=62(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 183
LDI r2, 62
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
