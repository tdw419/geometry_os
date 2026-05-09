; DESCRIPTION: Draws a orange rectangle at (194, 43) with width 32 and height 29.
; PLAN: r0=194(x), r1=43(y), r2=32(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 43
LDI r2, 32
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
