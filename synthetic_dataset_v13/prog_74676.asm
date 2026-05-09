; DESCRIPTION: Draws a white rectangle at (263, 13) with width 116 and height 67.
; PLAN: r0=263(x), r1=13(y), r2=116(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 13
LDI r2, 116
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
