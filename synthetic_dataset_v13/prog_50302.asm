; DESCRIPTION: Draws a white rectangle at (93, 105) with width 78 and height 113.
; PLAN: r0=93(x), r1=105(y), r2=78(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 105
LDI r2, 78
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
