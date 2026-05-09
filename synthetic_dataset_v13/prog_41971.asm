; DESCRIPTION: Draws a white rectangle at (397, 49) with width 83 and height 94.
; PLAN: r0=397(x), r1=49(y), r2=83(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 49
LDI r2, 83
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
