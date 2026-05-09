; DESCRIPTION: Draws a white rectangle at (299, 15) with width 75 and height 95.
; PLAN: r0=299(x), r1=15(y), r2=75(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 15
LDI r2, 75
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
