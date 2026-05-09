; DESCRIPTION: Draws a white rectangle at (173, 139) with width 81 and height 19.
; PLAN: r0=173(x), r1=139(y), r2=81(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 139
LDI r2, 81
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
