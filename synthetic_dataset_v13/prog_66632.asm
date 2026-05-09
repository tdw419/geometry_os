; DESCRIPTION: Draws a black rectangle at (256, 142) with width 84 and height 60.
; PLAN: r0=256(x), r1=142(y), r2=84(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 142
LDI r2, 84
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
