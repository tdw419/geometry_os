; DESCRIPTION: Draws a black rectangle at (184, 87) with width 97 and height 86.
; PLAN: r0=184(x), r1=87(y), r2=97(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 87
LDI r2, 97
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
