; DESCRIPTION: Draws a white rectangle at (276, 74) with width 37 and height 81.
; PLAN: r0=276(x), r1=74(y), r2=37(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 74
LDI r2, 37
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
