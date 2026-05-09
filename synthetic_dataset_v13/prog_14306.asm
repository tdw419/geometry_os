; DESCRIPTION: Draws a blue rectangle at (11, 122) with width 91 and height 109.
; PLAN: r0=11(x), r1=122(y), r2=91(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 122
LDI r2, 91
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
