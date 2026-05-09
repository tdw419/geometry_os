; DESCRIPTION: Draws a white rectangle at (85, 5) with width 13 and height 76.
; PLAN: r0=85(x), r1=5(y), r2=13(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 5
LDI r2, 13
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
