; DESCRIPTION: Draws a white rectangle at (434, 49) with width 67 and height 106.
; PLAN: r0=434(x), r1=49(y), r2=67(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 49
LDI r2, 67
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
