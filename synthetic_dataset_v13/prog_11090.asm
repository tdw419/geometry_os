; DESCRIPTION: Draws a blue rectangle at (361, 67) with width 105 and height 36.
; PLAN: r0=361(x), r1=67(y), r2=105(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 67
LDI r2, 105
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
