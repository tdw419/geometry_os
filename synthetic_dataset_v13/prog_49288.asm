; DESCRIPTION: Draws a green rectangle at (4, 67) with width 48 and height 29.
; PLAN: r0=4(x), r1=67(y), r2=48(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 67
LDI r2, 48
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
