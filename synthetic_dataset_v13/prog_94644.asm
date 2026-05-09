; DESCRIPTION: Draws a white rectangle at (375, 35) with width 21 and height 112.
; PLAN: r0=375(x), r1=35(y), r2=21(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 35
LDI r2, 21
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
