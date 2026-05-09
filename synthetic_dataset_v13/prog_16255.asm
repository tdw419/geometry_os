; DESCRIPTION: Draws a blue rectangle at (357, 133) with width 67 and height 88.
; PLAN: r0=357(x), r1=133(y), r2=67(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 133
LDI r2, 67
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
