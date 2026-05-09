; DESCRIPTION: Draws a white rectangle at (209, 172) with width 90 and height 30.
; PLAN: r0=209(x), r1=172(y), r2=90(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 172
LDI r2, 90
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
