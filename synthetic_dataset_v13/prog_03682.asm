; DESCRIPTION: Draws a white rectangle at (488, 134) with width 11 and height 11.
; PLAN: r0=488(x), r1=134(y), r2=11(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 134
LDI r2, 11
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
