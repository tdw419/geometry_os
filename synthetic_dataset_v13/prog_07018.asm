; DESCRIPTION: Draws a white rectangle at (74, 67) with width 116 and height 64.
; PLAN: r0=74(x), r1=67(y), r2=116(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 67
LDI r2, 116
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
