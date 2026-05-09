; DESCRIPTION: Draws a white rectangle at (135, 157) with width 76 and height 69.
; PLAN: r0=135(x), r1=157(y), r2=76(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 157
LDI r2, 76
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
