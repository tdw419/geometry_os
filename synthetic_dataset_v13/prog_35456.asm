; DESCRIPTION: Draws a white rectangle at (318, 19) with width 67 and height 77.
; PLAN: r0=318(x), r1=19(y), r2=67(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 19
LDI r2, 67
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
