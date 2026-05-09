; DESCRIPTION: Draws a green rectangle at (133, 157) with width 13 and height 64.
; PLAN: r0=133(x), r1=157(y), r2=13(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 157
LDI r2, 13
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
