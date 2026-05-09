; DESCRIPTION: Draws a green rectangle at (128, 151) with width 96 and height 67.
; PLAN: r0=128(x), r1=151(y), r2=96(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 151
LDI r2, 96
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
