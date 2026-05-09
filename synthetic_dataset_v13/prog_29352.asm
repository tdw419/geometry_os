; DESCRIPTION: Draws a green rectangle at (173, 101) with width 101 and height 97.
; PLAN: r0=173(x), r1=101(y), r2=101(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 101
LDI r2, 101
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
