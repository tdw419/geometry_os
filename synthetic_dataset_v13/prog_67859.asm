; DESCRIPTION: Draws a white rectangle at (150, 75) with width 119 and height 75.
; PLAN: r0=150(x), r1=75(y), r2=119(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 75
LDI r2, 119
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
