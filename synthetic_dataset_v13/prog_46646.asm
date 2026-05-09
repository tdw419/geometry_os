; DESCRIPTION: Draws a green rectangle at (441, 43) with width 29 and height 67.
; PLAN: r0=441(x), r1=43(y), r2=29(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 43
LDI r2, 29
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
