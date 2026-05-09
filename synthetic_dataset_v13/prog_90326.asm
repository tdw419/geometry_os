; DESCRIPTION: Draws a white rectangle at (238, 36) with width 119 and height 67.
; PLAN: r0=238(x), r1=36(y), r2=119(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 36
LDI r2, 119
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
