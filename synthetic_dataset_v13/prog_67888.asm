; DESCRIPTION: Draws a white rectangle at (209, 43) with width 109 and height 96.
; PLAN: r0=209(x), r1=43(y), r2=109(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 43
LDI r2, 109
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
