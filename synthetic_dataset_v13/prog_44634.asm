; DESCRIPTION: Draws a white rectangle at (210, 56) with width 83 and height 115.
; PLAN: r0=210(x), r1=56(y), r2=83(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 56
LDI r2, 83
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
