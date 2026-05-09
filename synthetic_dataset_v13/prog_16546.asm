; DESCRIPTION: Draws a white rectangle at (116, 125) with width 58 and height 116.
; PLAN: r0=116(x), r1=125(y), r2=58(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 125
LDI r2, 58
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
