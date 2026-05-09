; DESCRIPTION: Draws a white rectangle at (316, 156) with width 107 and height 32.
; PLAN: r0=316(x), r1=156(y), r2=107(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 156
LDI r2, 107
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
