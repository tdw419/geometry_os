; DESCRIPTION: Draws a white rectangle at (85, 75) with width 53 and height 51.
; PLAN: r0=85(x), r1=75(y), r2=53(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 75
LDI r2, 53
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
