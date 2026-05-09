; DESCRIPTION: Draws a white rectangle at (165, 102) with width 116 and height 26.
; PLAN: r0=165(x), r1=102(y), r2=116(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 102
LDI r2, 116
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
