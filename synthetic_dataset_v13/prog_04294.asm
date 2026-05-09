; DESCRIPTION: Draws a green rectangle at (157, 173) with width 114 and height 22.
; PLAN: r0=157(x), r1=173(y), r2=114(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 173
LDI r2, 114
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
