; DESCRIPTION: Draws a white rectangle at (379, 81) with width 74 and height 24.
; PLAN: r0=379(x), r1=81(y), r2=74(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 81
LDI r2, 74
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
