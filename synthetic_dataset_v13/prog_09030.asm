; DESCRIPTION: Draws a blue rectangle at (265, 65) with width 15 and height 59.
; PLAN: r0=265(x), r1=65(y), r2=15(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 65
LDI r2, 15
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
