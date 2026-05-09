; DESCRIPTION: Draws a white rectangle at (497, 95) with width 15 and height 44.
; PLAN: r0=497(x), r1=95(y), r2=15(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 95
LDI r2, 15
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
