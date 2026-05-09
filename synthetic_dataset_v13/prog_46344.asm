; DESCRIPTION: Draws a blue rectangle at (421, 83) with width 65 and height 31.
; PLAN: r0=421(x), r1=83(y), r2=65(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 83
LDI r2, 65
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
