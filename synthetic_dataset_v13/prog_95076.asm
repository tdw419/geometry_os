; DESCRIPTION: Draws a blue rectangle at (88, 134) with width 12 and height 95.
; PLAN: r0=88(x), r1=134(y), r2=12(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 134
LDI r2, 12
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
