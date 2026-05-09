; DESCRIPTION: Draws a white rectangle at (50, 85) with width 85 and height 119.
; PLAN: r0=50(x), r1=85(y), r2=85(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 85
LDI r2, 85
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
