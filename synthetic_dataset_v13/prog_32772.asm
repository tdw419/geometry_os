; DESCRIPTION: Draws a white rectangle at (8, 25) with width 83 and height 53.
; PLAN: r0=8(x), r1=25(y), r2=83(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 25
LDI r2, 83
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
