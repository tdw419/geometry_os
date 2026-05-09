; DESCRIPTION: Draws a black rectangle at (256, 159) with width 119 and height 16.
; PLAN: r0=256(x), r1=159(y), r2=119(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 159
LDI r2, 119
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
