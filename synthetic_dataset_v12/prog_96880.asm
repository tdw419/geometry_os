; DESCRIPTION: Draws a green rectangle at (488, 108) with width 23 and height 66.
; PLAN: r0=488(x), r1=108(y), r2=23(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 108
LDI r2, 23
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
