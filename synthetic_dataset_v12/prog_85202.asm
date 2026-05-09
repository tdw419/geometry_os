; DESCRIPTION: Draws a blue rectangle at (189, 85) with width 67 and height 86.
; PLAN: r0=189(x), r1=85(y), r2=67(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 85
LDI r2, 67
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
