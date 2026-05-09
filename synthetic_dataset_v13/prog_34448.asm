; DESCRIPTION: Draws a green rectangle at (379, 116) with width 88 and height 107.
; PLAN: r0=379(x), r1=116(y), r2=88(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 116
LDI r2, 88
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
