; DESCRIPTION: Draws a purple rectangle at (334, 173) with width 83 and height 11.
; PLAN: r0=334(x), r1=173(y), r2=83(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 173
LDI r2, 83
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
