; DESCRIPTION: Draws a white rectangle at (452, 116) with width 38 and height 25.
; PLAN: r0=452(x), r1=116(y), r2=38(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 116
LDI r2, 38
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
