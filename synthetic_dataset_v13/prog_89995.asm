; DESCRIPTION: Draws a blue rectangle at (274, 67) with width 95 and height 44.
; PLAN: r0=274(x), r1=67(y), r2=95(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 67
LDI r2, 95
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
