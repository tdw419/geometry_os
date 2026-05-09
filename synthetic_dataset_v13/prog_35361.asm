; DESCRIPTION: Draws a black rectangle at (371, 188) with width 46 and height 49.
; PLAN: r0=371(x), r1=188(y), r2=46(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 188
LDI r2, 46
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
