; DESCRIPTION: Draws a white rectangle at (183, 4) with width 116 and height 82.
; PLAN: r0=183(x), r1=4(y), r2=116(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 4
LDI r2, 116
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
