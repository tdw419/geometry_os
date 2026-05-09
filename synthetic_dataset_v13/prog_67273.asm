; DESCRIPTION: Draws a black rectangle at (274, 84) with width 32 and height 115.
; PLAN: r0=274(x), r1=84(y), r2=32(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 84
LDI r2, 32
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
