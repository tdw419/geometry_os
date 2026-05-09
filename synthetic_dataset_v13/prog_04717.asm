; DESCRIPTION: Draws a black rectangle at (32, 164) with width 97 and height 81.
; PLAN: r0=32(x), r1=164(y), r2=97(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 164
LDI r2, 97
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
