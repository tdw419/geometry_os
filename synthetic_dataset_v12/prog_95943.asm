; DESCRIPTION: Draws a white rectangle at (375, 87) with width 15 and height 79.
; PLAN: r0=375(x), r1=87(y), r2=15(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 87
LDI r2, 15
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
