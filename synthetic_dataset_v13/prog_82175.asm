; DESCRIPTION: Draws a blue rectangle at (245, 29) with width 91 and height 67.
; PLAN: r0=245(x), r1=29(y), r2=91(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 29
LDI r2, 91
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
