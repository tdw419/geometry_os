; DESCRIPTION: Draws a white rectangle at (151, 90) with width 43 and height 38.
; PLAN: r0=151(x), r1=90(y), r2=43(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 90
LDI r2, 43
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
