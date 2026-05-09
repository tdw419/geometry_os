; DESCRIPTION: Draws a blue rectangle at (227, 67) with width 51 and height 42.
; PLAN: r0=227(x), r1=67(y), r2=51(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 67
LDI r2, 51
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
