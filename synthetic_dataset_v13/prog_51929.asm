; DESCRIPTION: Draws a purple rectangle at (414, 69) with width 21 and height 85.
; PLAN: r0=414(x), r1=69(y), r2=21(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 69
LDI r2, 21
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
