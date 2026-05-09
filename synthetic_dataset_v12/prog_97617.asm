; DESCRIPTION: Draws a green rectangle at (128, 188) with width 66 and height 44.
; PLAN: r0=128(x), r1=188(y), r2=66(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 188
LDI r2, 66
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
