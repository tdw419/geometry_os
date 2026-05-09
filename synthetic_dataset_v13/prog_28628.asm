; DESCRIPTION: Draws a white rectangle at (5, 144) with width 76 and height 23.
; PLAN: r0=5(x), r1=144(y), r2=76(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 144
LDI r2, 76
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
