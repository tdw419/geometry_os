; DESCRIPTION: Draws a white rectangle at (343, 19) with width 67 and height 72.
; PLAN: r0=343(x), r1=19(y), r2=67(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 19
LDI r2, 67
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
