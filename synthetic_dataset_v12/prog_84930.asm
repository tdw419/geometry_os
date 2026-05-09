; DESCRIPTION: Draws a white rectangle at (275, 43) with width 95 and height 30.
; PLAN: r0=275(x), r1=43(y), r2=95(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 43
LDI r2, 95
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
