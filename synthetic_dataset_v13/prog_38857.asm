; DESCRIPTION: Draws a white rectangle at (381, 73) with width 55 and height 84.
; PLAN: r0=381(x), r1=73(y), r2=55(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 73
LDI r2, 55
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
