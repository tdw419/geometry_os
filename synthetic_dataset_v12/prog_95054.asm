; DESCRIPTION: Draws a black rectangle at (327, 101) with width 32 and height 97.
; PLAN: r0=327(x), r1=101(y), r2=32(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 101
LDI r2, 32
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
