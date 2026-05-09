; DESCRIPTION: Draws a green rectangle at (488, 73) with width 12 and height 80.
; PLAN: r0=488(x), r1=73(y), r2=12(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 73
LDI r2, 12
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
