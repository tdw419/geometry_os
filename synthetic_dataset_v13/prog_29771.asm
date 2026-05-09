; DESCRIPTION: Draws a white rectangle at (421, 88) with width 27 and height 113.
; PLAN: r0=421(x), r1=88(y), r2=27(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 88
LDI r2, 27
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
