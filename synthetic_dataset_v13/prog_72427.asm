; DESCRIPTION: Draws a white rectangle at (250, 76) with width 75 and height 96.
; PLAN: r0=250(x), r1=76(y), r2=75(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 76
LDI r2, 75
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
