; DESCRIPTION: Draws a white rectangle at (241, 25) with width 85 and height 116.
; PLAN: r0=241(x), r1=25(y), r2=85(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 25
LDI r2, 85
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
