; DESCRIPTION: Draws a white rectangle at (25, 85) with width 110 and height 18.
; PLAN: r0=25(x), r1=85(y), r2=110(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 85
LDI r2, 110
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
