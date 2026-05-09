; DESCRIPTION: Draws a white rectangle at (356, 159) with width 15 and height 28.
; PLAN: r0=356(x), r1=159(y), r2=15(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 159
LDI r2, 15
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
