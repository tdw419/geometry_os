; DESCRIPTION: Draws a blue rectangle at (306, 17) with width 71 and height 69.
; PLAN: r0=306(x), r1=17(y), r2=71(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 17
LDI r2, 71
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
